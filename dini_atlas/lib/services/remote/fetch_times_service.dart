import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/models/location_api/country.dart';
import 'package:dini_atlas/models/location_api/state.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/models/user_location.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:flutter/material.dart';

import 'dio_service.dart';

class FetchTimesException implements Exception {
  final String message;
  FetchTimesException(this.message);
}

class FetchTimesService {
  final _userSettings = locator<UserSettingsService>();
  final _dio = locator<DioService>();

  final String _baseUrl = "https://ezanvakti.herokuapp.com/";
  final String _countryUrl = "/ulkeler";
  final String _cityUrl = "/sehirler";
  final String _stateUrl = "/ilce";
  final String _timesUrl = "/vakitler";

  Future<void> fetchTimes() async {
    final UserLocation userLocation =
        await _userSettings.getUserLocation().then((v) => v!);

    final String countryId = await _getUserCountryId(userLocation.country);
    final String cityId = await _getUserCityId(userLocation.city);
    final String stateId =
        await _getUserStateId(userLocation.city, userLocation.state);

    final List<PrayerTime> times = await _getTimes(stateId);
  }

  Future<String> _getUserCountryId(String country) async {
    final response = await _dio.request(_baseUrl + _countryUrl);

    if (response == null || response.statusCode != 200) {
      throw FetchTimesException("Ülke bilgisi getirilirken sorun oluştu.");
    }

    final List<Country> countries =
        (response.data as List).map((e) => Country.fromJson(e)).toList();

    return countries
        .singleWhere((e) => e.ulkeAdi == country.toUpperCase())
        .ulkeId;
  }

  Future<String> _getUserCityId(String city) async {
    final response = await _dio.request(_baseUrl + _cityUrl);

    if (response == null || response.statusCode != 200) {
      throw FetchTimesException("Şehir bilgisi getirilirken sorun oluştu.");
    }

    final List<City> cities =
        (response.data as List).map((e) => City.fromJson(e)).toList();

    return cities.singleWhere((e) => e.sehirAdi == city.toUpperCase()).sehirId;
  }

  Future<String> _getUserStateId(String city, String state) async {
    final response = await _dio.request(_baseUrl + _stateUrl);

    if (response == null || response.statusCode != 200) {
      throw FetchTimesException("İlçe bilgisi getirilirken sorun oluştu.");
    }

    final List<StateModel> cities =
        (response.data as List).map((e) => StateModel.fromJson(e)).toList();

    int foundIndex = cities.indexWhere((e) => e.ilceAdi == state.toUpperCase());
    if (foundIndex == -1) {
      foundIndex = cities.indexWhere((e) => e.ilceAdi == city.toUpperCase());
    }
    return cities[foundIndex].ilceId;
  }

  Future<List<PrayerTime>> _getTimes(String stateId) async {
    final response = await _dio.request(_baseUrl + _timesUrl);

    if (response == null || response.statusCode != 200) {
      throw FetchTimesException(
          "Güncel vakit bilgileri getirilirken sorun oluştu.");
    }

    final List<PrayerTime> times =
        (response.data as List).map((e) => PrayerTime.fromJson(e)).toList();
    return times;
  }
}
