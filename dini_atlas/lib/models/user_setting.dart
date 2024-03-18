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

  /// Kullanıcı Giriş Bilgileri
  String? userMail;

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

  /// Alarm Modu: Vakit bildirimlerinin alarm kullanılarak sağlanması
  bool alarmMode = true;

  /// Kuran okuyucu id
  int quranReciterId = -1;

  /// Son okunan ayet
  SavedLastAyah savedLastAyah = SavedLastAyah();

  /// Font boyutunu +[value] arttır
  int increaseAyahFontSize = 0;

  /// Sûre Ayarları
  SuraSetting suraSetting = SuraSetting();

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

  PrayerNotiSettings();

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

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "voiceWarningEnable": voiceWarningEnable,
        "advancedWarningSoundsEnable": advancedWarningSoundsEnable,
        "advancedVoiceWarningTime": advancedVoiceWarningTime,
        "warningSoundId": warningSoundId
      };

  PrayerNotiSettings.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        voiceWarningEnable = json['voiceWarningEnable'],
        advancedWarningSoundsEnable = json['advancedWarningSoundsEnable'],
        advancedVoiceWarningTime = json['advancedVoiceWarningTime'],
        warningSoundId = json['warningSoundId'];
}

@embedded
class SuraSetting {
  /// Arapça metni göster
  bool showArabicText = true;

  /// Türkce metni göster
  bool showTurkishText = true;

  /// Türkçe meali göster
  bool showMeaningText = true;

  /// Ayet sesli oynatma bitince, diğer ayeti oynat
  bool playerAutoChange = true;

  SuraSetting copyWith({
    bool? showArabicText,
    bool? showTurkishText,
    bool? showMeaningText,
    bool? playerAutoChange,
  }) {
    return SuraSetting()
      ..showArabicText = showArabicText ?? this.showArabicText
      ..showTurkishText = showTurkishText ?? this.showTurkishText
      ..showMeaningText = showMeaningText ?? this.showMeaningText
      ..playerAutoChange = playerAutoChange ?? this.playerAutoChange;
  }
}

@embedded
class SavedLastAyah {
  String sura = "Fâtiha Sûresi";
  int suraId = 1;
  int ayah = 1;
}
