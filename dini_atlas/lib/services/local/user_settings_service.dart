import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/models/location_api/country.dart';
import 'package:dini_atlas/models/location_api/state.dart';
import 'package:dini_atlas/models/user_location.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/isar_service.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

class UserSettingsException implements Exception {
  final String message;
  UserSettingsException(this.message);
}

class UserSettingsService {
  final _db = locator<IsarService>().isar;
  late UserSetting userSettings;

  Future<UserSetting?> getUserSettings() async {
    try {
      final userSettings = await _db.userSettings.get(1);
      if (userSettings != null) this.userSettings = userSettings;
      if (kDebugMode) print("Kullanıcı ayarları getirildi");
      return userSettings;
    } catch (e) {
      throw UserSettingsException(
          "Kullanıcı ayarları alınırken bir sorun oluştu. $e");
    }
  }

  Future<void> setUserLocationSettings(
      {required UserLocation location,
      Country? country,
      City? city,
      StateModel? state}) async {
    try {
      final jsonString = jsonEncode(location.toJson());
      await _db.writeTxn(() async => await _db.userSettings.clear());

      // Nesne oluştur
      final userSettings = UserSetting()..jsonString = jsonString;

      if (country != null) userSettings.country = country;
      if (city != null) userSettings.city = city;
      if (state != null) userSettings.state = state;

      this.userSettings = userSettings;

      // Veriyi kaydet
      await _db.writeTxn(() async => await _db.userSettings.put(userSettings));

      if (kDebugMode) print("Kullanıcı ayarları kaydedildi");
    } catch (e) {
      throw UserSettingsException(
          "Kullanıcı ayarları kaydedilirken bir sorun oluştu. $e");
    }
  }
}
