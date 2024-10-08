import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/models/location_api/country.dart';
import 'package:dini_atlas/models/location_api/state.dart';
import 'package:dini_atlas/models/rosary_setting.dart';
import 'package:dini_atlas/models/user_location.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/isar_service.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserSettingsException implements Exception {
  final String message;
  UserSettingsException(this.message);
}

class UserSettingsService {
  final _db = locator<IsarService>().isar;
  UserSettings? userSettings;

  bool isZoomInfoShown = false;

  Future<UserSettings?> getUserSettings() async {
    try {
      if (this.userSettings != null) return this.userSettings;
      final userSettings = await _db.userSettings.get(1);
      if (userSettings != null) this.userSettings = userSettings;
      if (kDebugMode) print("Kullanıcı ayarları getirildi");
      return userSettings;
    } catch (e) {
      throw UserSettingsException(
          "Kullanıcı ayarları alınırken bir sorun oluştu. $e");
    }
  }

  Future<void> setUserSettings(UserSettings value) async {
    try {
      userSettings = value;
      // Veriyi kaydet
      await _db.writeTxn(() async => await _db.userSettings.put(value));
    } catch (e) {
      throw UserSettingsException(
          "UserSettings - kaydedilirken bir sorun oluştu. $e");
    }
  }

  Future<void> setUserLocationSettings({
    required UserLocation location,
    Country? country,
    City? city,
    StateModel? state,
  }) async {
    try {
      final jsonString = jsonEncode(location.toJson());
      await _db.writeTxn(() async => await _db.userSettings.clear());

      // Nesne oluştur
      final userSettings = UserSettings()..jsonString = jsonString;

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

  Future<UserSettings> setSilentMode(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userSettings = await getUserSettings();
      userSettings!.silentModeEnable = value;
      this.userSettings = userSettings;
      // Veriyi kaydet
      await _db.writeTxn(() async => await _db.userSettings.put(userSettings));
      await prefs.setBool("silentMode", value);
      return userSettings;
    } catch (e) {
      throw UserSettingsException(
          "Sessiz mod ayarı kaydedilirken bir sorun oluştu. $e");
    }
  }

  Future<UserSettings> setAlarmMode(bool value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userSettings = await getUserSettings();
      userSettings!.alarmMode = value;
      this.userSettings = userSettings;
      // Veriyi kaydet
      await _db.writeTxn(() async => await _db.userSettings.put(userSettings));
      await prefs.setBool("alarmMode", value);
      return userSettings;
    } catch (e) {
      throw UserSettingsException(
          "Alarm mode - kaydedilirken bir sorun oluştu. $e");
    }
  }

  Future<UserSettings> setQuranReciter(int id) async {
    try {
      final userSettings = await getUserSettings();
      userSettings!.quranReciterId = id;
      this.userSettings = userSettings;
      // Veriyi kaydet
      await _db.writeTxn(() async => await _db.userSettings.put(userSettings));
      return userSettings;
    } catch (e) {
      throw UserSettingsException(
          "Sessiz mod ayarı kaydedilirken bir sorun oluştu. $e");
    }
  }

  Future<void> setPrayerNotiSettings(
      {required PrayerNotiSettings prayerNotiSettings,
      bool updateAll = false}) async {
    try {
      if (!updateAll) {
        // Tek vakti güncelle
        await _db.writeTxn(
            () async => _db.prayerNotiSettings.putByName(prayerNotiSettings));
      } else {
        // Tüm vakitleri güncelle
        for (PrayerType type in PrayerType.values) {
          if (type == PrayerType.all) continue;
          final value = prayerNotiSettings..name = type.text;
          await _db
              .writeTxn(() async => _db.prayerNotiSettings.putByName(value));
        }
      }

      if (kDebugMode) print("Vakit ayarları kaydedildi");
    } catch (e) {
      throw UserSettingsException(
          "Vakit ayarları kaydedilirken bir sorun oluştu. $e");
    }
  }

  Future<PrayerNotiSettings> getPrayerNotiSettings(
      {required PrayerType prayerType}) async {
    try {
      final value = await _db.prayerNotiSettings.getByName(prayerType.text);
      if (kDebugMode) print("${prayerType.text} Vakit Ayarları Getirildi");

      return value!;
    } catch (e) {
      throw UserSettingsException(
          "${prayerType.text} Vakit ayarları getirilirken bir sorun oluştu. $e");
    }
  }

  Future<List<PrayerNotiSettings>> getAllPrayerNotiSettings() async {
    try {
      final values = await _db.prayerNotiSettings.where().findAll();
      if (kDebugMode) print("Tüm vakitlere ait ayarlar getirildi");
      return values;
    } catch (e) {
      throw UserSettingsException(
          "Liste olarak vakit ayarları getirilirken bir sorun oluştu. $e");
    }
  }

  Future<UserSettings> setSuraSettings(SuraSetting suraSettings) async {
    try {
      final userSettings = await getUserSettings();
      userSettings!.suraSetting = suraSettings;
      this.userSettings = userSettings;
      // Veriyi kaydet
      await _db.writeTxn(() async => await _db.userSettings.put(userSettings));
      return userSettings;
    } catch (e) {
      throw UserSettingsException(
          "Sûre ayarları kaydedilirken sorun oluştu $e");
    }
  }

  Future<UserSettings> setIncreaseFontSizeForAyah(int size) async {
    try {
      final userSettings = await getUserSettings();
      userSettings!.increaseAyahFontSize = size;
      this.userSettings = userSettings;
      // Veriyi kaydet
      await _db.writeTxn(() async => _db.userSettings.put(userSettings));
      return userSettings;
    } catch (e) {
      throw UserSettingsException(
          "Ayet font ayarı kaydedilirken bir sorun oluştu $e");
    }
  }

  RosarySetting? _rosarySetting;
  Future<RosarySetting> getRosarySetting() async {
    try {
      if (_rosarySetting != null) return _rosarySetting!;
      final value = await _db.rosarySettings.get(1);
      _rosarySetting = value ?? RosarySetting();
      return _rosarySetting!;
    } catch (e) {
      throw UserSettingsException(
          "Tesbih verileri getirilirken bir sorun oluştu $e");
    }
  }

  Future<RosarySetting> setRosarySetting(RosarySetting rosarySetting) async {
    try {
      await _db
          .writeTxn(() async => await _db.rosarySettings.put(rosarySetting));
      _rosarySetting = rosarySetting;
      return rosarySetting;
    } catch (e) {
      throw UserSettingsException(
          "Tesbih verileri kaydedilirken bir sorun oluştu $e");
    }
  }

  Future<UserSettings> setUserMail(String mail) async {
    try {
      final userSettings = await getUserSettings();
      userSettings!.userMail = mail;
      this.userSettings = userSettings;
      // Veriyi kaydet
      await _db.writeTxn(() async => _db.userSettings.put(userSettings));
      return userSettings;
    } catch (e) {
      throw UserSettingsException(
          "Kullanıcı mail bilgisi kaydedilirken bir sorun oluştu $e");
    }
  }

  Future<UserSettings> setLastReadAyah(SavedLastAyah lastReadAyah) async {
    try {
      final userSettings = await getUserSettings();
      userSettings!.savedLastAyah = lastReadAyah;
      this.userSettings = userSettings;
      // Veriyi kaydet
      await _db.writeTxn(() async => _db.userSettings.put(userSettings));
      return userSettings;
    } catch (e) {
      throw UserSettingsException(
          "Son okunan ayet kaydedilirken bir sorun oluştu $e");
    }
  }

  // Background Task'da kullanmak üzere bildirim ayarlarını SharedPreferences'a kaydet
  void setPrayerNotiSettingsForBackgroundTask(
      List<PrayerNotiSettings> settingsList) async {
    final prefs = await SharedPreferences.getInstance();

    // Verileri String formatında listeye dönüştür
    final List<String> stringList =
        settingsList.map((e) => jsonEncode(e.toJson())).toList();

    // Verileri cihaza kaydet
    await prefs.setStringList("userNotiSettings", stringList);
  }

  static Future<bool> getSilentModeSettingForBackgroundTask() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("silentMode") ?? false;
  }
}
