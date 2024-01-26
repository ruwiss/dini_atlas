import 'package:dini_atlas/models/location_api/city.dart';
import 'package:dini_atlas/models/location_api/country.dart';
import 'package:dini_atlas/models/location_api/state.dart';
import 'package:isar/isar.dart';
import 'dart:convert';

part 'user_setting.g.dart';

enum PrayerType {
  imsak("İmsak"),
  gunes("Güneş"),
  ogle("Öğle"),
  ikindi("İkindi"),
  aksam("Akşam"),
  yatsi("Yatsı"),
  all("Hepsi");

  final String text;
  const PrayerType(this.text);
}

@collection
class UserSettings {
  Id id = Isar.autoIncrement;

  /// Kullanıcı konumu jsonString
  late String jsonString;

  /// Kullanıcı ülkesi ve id
  Country? country;

  /// Kullanıcı şehri ve id
  City? city;

  /// Kullanıcı ilçesi ve id
  StateModel? state;

  /// Sessiz Mod: vakitten 5 dk önceden 30 dk sonraya kadar
  bool silentModeEnable = false;

  /// Kuran okuyucu id
  int quranReciterId = 0;

  Map<String, dynamic> jsonValue() => jsonDecode(jsonString);
}

@collection
class PrayerNotiSettings {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String name;

  /// Sesli Uyarı
  bool voiceWarningEnable = true;

  /// Önceden sesli uyarı
  bool advancedWarningSoundsEnable = true;

  /// Önceden sesli uyarı için zaman
  int advancedVoiceWarningTime = 15;

  /// Sesli uyarı için ses
  int warningSoundId = 0;

  // Create copyWith function
  PrayerNotiSettings copyWith({
    int? id,
    String? name,
    bool? voiceWarningEnable,
    bool? advancedWarningSoundsEnable,
    int? advancedVoiceWarningTime,
    int? warningSoundId,
  }) {
    return PrayerNotiSettings()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..voiceWarningEnable = voiceWarningEnable ?? this.voiceWarningEnable
      ..advancedWarningSoundsEnable =
          advancedWarningSoundsEnable ?? this.advancedWarningSoundsEnable
      ..advancedVoiceWarningTime =
          advancedVoiceWarningTime ?? this.advancedVoiceWarningTime
      ..warningSoundId = warningSoundId ?? this.warningSoundId;
  }
}
