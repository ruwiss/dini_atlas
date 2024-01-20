import 'dart:convert';

import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/models/location_api/country.dart';
import 'package:dini_atlas/models/location_api/state.dart';
import 'package:dini_atlas/models/prayer/eid_prayer.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/models/user_location.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/app/app.locator.dart';

import 'dio_service.dart';

class FetchTimesException implements Exception {
  final String message;
  FetchTimesException(this.message);
}

class FetchTimesService {
  final _userSettings = locator<UserSettingsService>();
  final _prayerTimesService = locator<PrayerTimesService>();
  final _dio = locator<DioService>();

  final String _baseUrl = "https://ezanvakti.herokuapp.com";
  final String _countryUrl = "ulkeler";
  final String _cityUrl = "sehirler";
  final String _stateUrl = "ilceler";
  final String _timesUrl = "vakitler";
  final String _eidTimesUrl = "bayram-namazi";

  Future<void> fetchTimes({UserLocation? userLocation}) async {
    try {
      // kullanıcı kayıtlı ayarlarını getir
      UserSetting? userSettings = await _userSettings.getUserSettings();

      if (userSettings == null) {
        throw UserSettingsException("Kullanıcıya ait kayıtlı ayar bulunamadı.");
      }

      bool dontFetchTimes = false;

      // Daha önceden kullanıcı lokasyon id'leri çekildi mi kontrol et
      if (userSettings.city == null) {
        // kullanıcı lokasyon idlerini getir
        final values = await _getLocationIds(
            UserLocation.fromIsarJson(userSettings.jsonString));
        // modeli güncelle
        userSettings
          ..city = values.city
          ..state = values.state;
      } else {
        // yeni lokasyon verilmiş mi kontrol et
        if (userLocation != null) {
          final String oldLocation = userSettings.jsonString;
          final String newLocation = jsonEncode(userLocation.toJson());

          // eğer yeni lokasyon mevcut lokasyondan farklıysa tekrar lokasyon idlerini getir
          if (oldLocation != newLocation) {
            // kullanıcı lokasyon idlerini getir
            final values = await _getLocationIds(userLocation);
            // modeli güncelle
            userSettings
              ..city = values.city
              ..state = values.state;
          } else {
            dontFetchTimes = true;
          }
        }
      }

      // Vakit bilgilerini getir ve kaydet
      if (!dontFetchTimes) await _fetchPrayerTimes(userSettings);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _fetchPrayerTimes(UserSetting userSetting) async {
    try {
      // vakitleri getir
      final List<PrayerTime> times = await _getTimes(userSetting.state!.ilceId);
      final EidPrayerTime eidTimes =
          await _getEidTimes(userSetting.city!, userSetting.state!.ilceId);

      // vakit bilgilerini veritabanına kaydet
      await _prayerTimesService.setPrayerTimes(
          times: times, eidTimes: eidTimes);
    } catch (e) {
      rethrow;
    }
  }

  Future<({City city, StateModel state})> _getLocationIds(
    UserLocation userLocation,
  ) async {
    try {
      // ülke idsini getirm
      final Country country = await _getUserCountry(userLocation.country);

      // sehir idsini getir
      final City city = await _getUserCity(userLocation.city, country.ulkeId);

      // ilce idsini getir
      final StateModel state = await _getUserState(
          userLocation.city, userLocation.state, city.sehirId);

      // getirilen id'leri kullanıcı ayarlarına kaydet
      await _userSettings.setUserSettings(
          country: country, city: city, state: state, location: userLocation);

      return (city: city, state: state);
    } catch (e) {
      rethrow;
    }
  }

  Future<Country> _getUserCountry(String country) async {
    try {
      final response = await _dio.request("$_baseUrl/$_countryUrl");

      if (response == null || response.statusCode != 200) {
        throw FetchTimesException("Ülke bilgisi getirilirken sorun oluştu.");
      }

      final List<Country> countries =
          (response.data as List).map((e) => Country.fromJson(e)).toList();

      return countries.singleWhere((e) =>
          e.ulkeAdi == country.toLowerCase() ||
          e.ulkeAdiEn == country.toLowerCase());
    } catch (e) {
      throw FetchTimesException(e.toString());
    }
  }

  Future<City> _getUserCity(String city, String countryId) async {
    try {
      final response = await _dio.request("$_baseUrl/$_cityUrl/$countryId");

      if (response == null || response.statusCode != 200) {
        throw FetchTimesException("Şehir bilgisi getirilirken sorun oluştu.");
      }

      final List<City> cities =
          (response.data as List).map((e) => City.fromJson(e)).toList();

      return cities.singleWhere((e) =>
          e.sehirAdi == city.toLowerCase() ||
          e.sehirAdiEn == city.toLowerCase());
    } catch (e) {
      throw FetchTimesException(e.toString());
    }
  }

  Future<StateModel> _getUserState(
      String city, String state, String cityId) async {
    try {
      final response = await _dio.request("$_baseUrl/$_stateUrl/$cityId");

      if (response == null || response.statusCode != 200) {
        throw FetchTimesException("İlçe bilgisi getirilirken sorun oluştu.");
      }

      final List<StateModel> cities =
          (response.data as List).map((e) => StateModel.fromJson(e)).toList();

      int foundIndex = cities.indexWhere((e) =>
          e.ilceAdi == state.toLowerCase() ||
          e.ilceAdiEn == state.toLowerCase());
      if (foundIndex == -1) {
        foundIndex = cities.indexWhere((e) =>
            e.ilceAdi == city.toLowerCase() ||
            e.ilceAdiEn == city.toLowerCase());
      }
      return cities[foundIndex];
    } catch (e) {
      throw FetchTimesException(e.toString());
    }
  }

  Future<List<PrayerTime>> _getTimes(String stateId) async {
    try {
      final response = await _dio.request("$_baseUrl/$_timesUrl/$stateId");

      if (response == null || response.statusCode != 200) {
        throw FetchTimesException(
            "Güncel vakit bilgileri getirilirken sorun oluştu.");
      }

      final List<PrayerTime> times =
          (response.data as List).map((e) => PrayerTime.fromJson(e)).toList();
      return times;
    } catch (e) {
      throw FetchTimesException(e.toString());
    }
  }

  Future<EidPrayerTime> _getEidTimes(City city, String stateId) async {
    try {
      final response =
          await _dio.request("$_baseUrl/$_eidTimesUrl/${city.sehirId}");

      if (response == null || response.statusCode != 200) {
        throw FetchTimesException(
            "Bayram namazı vakitleri getirilirken sorun oluştu.");
      }

      final List<EidPrayerTime> eidTimes = (response.data as List)
          .map((e) => EidPrayerTime.fromJson(e))
          .toList();

      final singleEidTime = eidTimes.singleWhere((e) =>
          e.ilceBilgisi.ilceId == stateId ||
          e.ilceBilgisi.ilceAdi == city.sehirAdi);

      return singleEidTime;
    } catch (e) {
      throw FetchTimesException(e.toString());
    }
  }
}
