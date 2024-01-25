import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/models/location_api/country.dart';
import 'package:dini_atlas/models/location_api/state.dart';
import 'package:isar/isar.dart';
import 'dart:convert';

part 'user_setting.g.dart';

@collection
class UserSetting {
  Id id = Isar.autoIncrement;
  late String jsonString;
  Country? country;
  City? city;
  StateModel? state;
  AppSettings appSettings = AppSettings.defaultSettings();

  Map<String, dynamic> jsonValue() => jsonDecode(jsonString);
}

@embedded
class AppSettings {
  late bool silentModeEnable;
  late bool voiceWarningEnable;
  late bool warningSoundsEnable;

  late int warningSoundId;
  late int advancedVoiceWarningTime;
  late int quranReciterId;

  AppSettings();

  factory AppSettings.defaultSettings() => AppSettings()
    ..silentModeEnable = false
    ..voiceWarningEnable = true
    ..warningSoundsEnable = true
    ..warningSoundId = 0
    ..advancedVoiceWarningTime = 15
    ..quranReciterId = 0;
}
