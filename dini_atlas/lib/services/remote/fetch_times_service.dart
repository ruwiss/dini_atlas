import 'dart:convert';
import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/models/location_api/country.dart';
import 'package:dini_atlas/models/location_api/state.dart';
import 'package:dini_atlas/models/prayer/eid_prayer.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/models/prayer/prayer_times.dart';
import 'package:dini_atlas/models/user_location.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:flutter/foundation.dart';

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

  Future<PrayerTimes?> fetchTimes({UserLocation? userLocation}) async {
    try {
      // kullanıcı kayıtlı ayarlarını getir
      UserSettings? userSettings = await _userSettings.getUserSettings();

      if (userSettings == null) {
        if (kDebugMode) print("Kullanıcı ayarları bulunamadı");
        throw UserSettingsException("Kullanıcıya ait kayıtlı ayar bulunamadı.");
      }

      bool dontFetchTimes = false;

      // Daha önceden kullanıcı lokasyon id'leri çekildi mi kontrol et
      if (userSettings.city == null) {
        if (kDebugMode) print("Kullanıcı lokasyon id'si bulunamadı");

        // kullanıcı lokasyon idlerini getir
        final values = await _getLocationIds(
            UserLocation.fromIsarJson(userSettings.jsonString));
        // modeli güncelle
        userSettings
          ..city = values.city
          ..state = values.state;

        if (kDebugMode) print("Kullanıcı lokasyon id'leri çekildi");
      } else {
        // yeni lokasyon verilmiş mi kontrol et
        if (userLocation != null) {
          if (kDebugMode) print("Yeni lokasyon belirlendi");
          final String oldLocation = userSettings.jsonString;
          final String newLocation = jsonEncode(userLocation.toJson());

          // eğer yeni lokasyon mevcut lokasyondan farklıysa tekrar lokasyon idlerini getir
          if (oldLocation != newLocation) {
            if (kDebugMode) print("Yeni lokasyon vakitleri getiriliyor..");
            // kullanıcı lokasyon idlerini getir
            final values = await _getLocationIds(userLocation);
            // modeli güncelle
            userSettings
              ..city = values.city
              ..state = values.state;
          } else {
            if (kDebugMode) {
              print("Yeni lokasyon öncekiyle aynı. Vakitler güncellenmeyecek");
            }
            dontFetchTimes = true;
          }
        }
      }

      // Eğer aynı lokasyonda tekrar istek yapılmadıysa
      if (!dontFetchTimes) {
        // Vakit bilgilerini getir
        final prayerTimes = await _fetchPrayerTimes(userSettings);

        if (kDebugMode) print("Vakit bilgileri çekildi");

        // vakit bilgilerini veritabanına kaydet
        await _prayerTimesService.setPrayerTimes(prayerTimes);

        if (kDebugMode) print("Vakit bilgileri veritabanına kaydedildi");

        return prayerTimes;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<PrayerTimes> _fetchPrayerTimes(UserSettings userSetting) async {
    try {
      // vakitleri getir
      final List<PrayerTime> times = await _getTimes(userSetting.state!.ilceId);
      final EidPrayerTime eidTimes =
          await _getEidTimes(userSetting.city!, userSetting.state!.ilceId);

      // nesne oluştur
      final prayerTimes = PrayerTimes()
        ..prayerTimes = times
        ..eidPrayers = eidTimes
        ..lastFetch = DateTime.now();

      return prayerTimes;
    } catch (e) {
      rethrow;
    }
  }

  Future<PrayerTimes?> updateAndGetTimes() async {
    try {
      await fetchTimes();
      final result = await _prayerTimesService.getPrayerTimes();
      return result.fold((l) => l, (r) => null);
    } catch (e) {
      throw PrayerTimesException(e.toString());
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
      await _userSettings.setUserLocationSettings(
          country: country, city: city, state: state, location: userLocation);

      if (kDebugMode) print("Lokasyon idleri veritabanına kaydedildi");

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

      if (kDebugMode) print("- Vakit namazları getirildi.");
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

      if (kDebugMode) print("- Bayram namazları getirildi.");

      return singleEidTime;
    } catch (e) {
      throw FetchTimesException(e.toString());
    }
  }
}
