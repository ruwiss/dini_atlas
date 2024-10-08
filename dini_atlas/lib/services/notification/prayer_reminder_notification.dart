import 'dart:async';

import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_shared_p.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/ui/common/constants/app_sounds.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sound_mode/sound_mode.dart';
import 'package:sound_mode/utils/ringer_mode_statuses.dart';
import 'app_notifications.dart';
import 'dart:convert';

class PrayerReminderNotification {
  static Future<void> showPrayerReminderNotification() async {
    final prefs = await SharedPreferences.getInstance();

    // Bildirim ayarlarını getir
    final List<String>? notiSettingsString =
        prefs.getStringList("userNotiSettings");
    if (notiSettingsString == null) return;
    final List<PrayerNotiSettings> notiSettings = notiSettingsString
        .map((e) => PrayerNotiSettings.fromJson(jsonDecode(e)))
        .toList();

    // Namaz vakitlerini getir
    final List<PrayerSharedP>? prayerTimes =
        await PrayerTimesService.getPrayerTimesFromSharedPreferences();
    if (prayerTimes == null) return;

    final DateTime now = DateTime.now();
    final dateNowAsToday = DateTime(now.year, now.month, now.day);

    // Bugüne ait namaz vakitlerini filtrele
    final PrayerSharedP currentPrayer =
        PrayerTimesService.getPrayerByDay(prayerTimes, now);

    int? advancedVoiceWarningTime;
    int? warningSoundId;

    // Sessiz Mod durumunu getir
    // Namazdan 5 dk önce ve 30 dk sonraya kadar
    final bool silentModeSettingValue =
        await UserSettingsService.getSilentModeSettingForBackgroundTask();

    debugPrint("Kullanıcı Sessiz Mod Seçeneği: $silentModeSettingValue");

    bool silentModeActivated = prefs.getBool("silentModeActivated") ?? false;

    // Sessiz mod için sıradaki namaz vaktini bul
    final result = await PrayerTimesService.calculateSharedPrefNextPrayerTime();

    // eğer sessiz mod aktifse
    if (silentModeSettingValue) {
      // Filtredeki vakti DateTime'a dönüştür
      final prayerDateTime = result!.item.timeValue.parseTimeAsDateTime();
      // Şimdiki vakti DateTime'a dönüştür
      final currentDateTime = DateTime(0, 0, 0, now.hour, now.minute);
      // ikisinin farkını dk olarak hesapla
      final diff = currentDateTime.difference(prayerDateTime).inMinutes;

      // Şimdiki zaman namaz vakti -5 dk ve +30 dk arasındaysa cihazı sessize alma modu
      if (diff >= -5 && diff <= 30) {
        await SoundMode.setSoundMode(RingerModeStatus.silent);
        prefs.setBool("silentModeActivated", true);
        silentModeActivated = true;
        debugPrint("silentModeActivated: true");
      } else if (silentModeActivated) {
        await SoundMode.setSoundMode(RingerModeStatus.normal);
      }
    }

    // Bugüne ait vakitleri filtreleyerek sıradaki namaz vaktini bul
    final index = currentPrayer.items.indexWhere((e) {
      bool returnValue = false;

      // Filtredeki vakte ait bildirim ayarlarını getir
      final PrayerNotiSettings currentPrayerSetting =
          notiSettings.singleWhere((s) => s.name == e.name);

      // Eğer bildirim ayarı etkinse vaktinde uyarı yap
      if (currentPrayerSetting.voiceWarningEnable) {
        // Zamanında uyarı
        if (e.timeValue == TimeOfDay.now().toHourMinString()) {
          warningSoundId = currentPrayerSetting.warningSoundId;
          debugPrint("Namaz vakti bildirim uyarısı - Ses: $warningSoundId");
          returnValue = true;
        } else {
          // Eğer bildirim ayarı etkinse vaktinden önce uyarı yap
          if (currentPrayerSetting.advancedWarningSoundsEnable) {
            // Kaç dakika önceden uyarılacak
            final int time = currentPrayerSetting.advancedVoiceWarningTime;

            // Önceden uyarı olduğu için şimdiki zamana [time] kadar ekleme yap
            final editedNotTime = TimeOfDay.now()
                .convertToDateTime()
                .add(Duration(minutes: time));

            // Vakitler aynı mı?
            if (e.timeValue.parseTime().toHourMinString() ==
                editedNotTime.toHourMinString()) {
              advancedVoiceWarningTime = time;
              warningSoundId = currentPrayerSetting.warningSoundId;
              debugPrint(
                  "Namaz vakti bildirim $time dk önceden uyarı - Ses $warningSoundId");
              returnValue = true;
            }
          }
        }
      }
      return returnValue;
    });

    PrayerSharedPItem? activePrayer;
    if (index != -1) {
      activePrayer = currentPrayer.items[index];

      // Eğer bu vakitte bildirim gönderdiysen tekrar gönderme (Sorun çözümü)
      final reminderNotiValue = prefs.getString('reminderNotiValue');
      final reminderValueNow =
          "$dateNowAsToday${activePrayer.name}"; // tarih + vakit
      if (reminderNotiValue == reminderValueNow) return;
      // Eğer bildirim gönderilmediyse gönderildi olarak prefs'e kaydet
      prefs.setString('reminderNotiValue', reminderValueNow);

      // sessiz mod etkinse sesi açıyoruz ve 10 saniye sonra kapatıyoruz
      // (Bildirimi sesli göstermek için)
      if (silentModeActivated && silentModeSettingValue) {
        await SoundMode.setSoundMode(RingerModeStatus.normal);
        debugPrint("Sessiz mod bildirim için kapatıldı");
        await Future.delayed(const Duration(seconds: 10));
      }
      // Ayarların düzgün çalışması için dinamik kanal adı oluşturuyoruz
      final String channel = "${ksPrayerReminderNotiChannel}_$warningSoundId";
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        channel,
        'Ezan Vakti Hatırlatıcı',
        channelDescription: 'Ezan vakti hatırlatıcı bildirimi',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        color: kcPrimaryColor,
        channelShowBadge: false,
        category: AndroidNotificationCategory.alarm,
        visibility: NotificationVisibility.public,
        playSound: true,
        sound: RawResourceAndroidNotificationSound(
          kaNotiSounds.firstWhere((e) => e.id == warningSoundId).rawPath,
        ),
      );

      NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);

      final bool alertBefore = advancedVoiceWarningTime != null;

      final String? subtitle =
          alertBefore ? '$advancedVoiceWarningTime dk kaldı' : null;

      final alertMessage = activePrayer.name == PrayerType.gunes.name
          ? 'Güneş ${alertBefore ? "Doğuyor.." : "Doğdu"}'
          : '${activePrayer.name} Namazı ${alertBefore ? "Uyarısı" : "Vakti"}';

      await AppNotifications.instance.localNotiPlugin
          .show(2, alertMessage, subtitle, notificationDetails);
      if (silentModeActivated && silentModeSettingValue) {
        await Future.delayed(const Duration(seconds: 15));
        await SoundMode.setSoundMode(RingerModeStatus.silent);
        debugPrint("Sessiz mod geri açıldı");
      }
    }
  }
}
