import 'dart:convert';

import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_shared_p.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/local/user_settings_service.dart';
import 'package:dini_atlas/ui/common/constants/app_sounds.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'push_notification.dart';

class PrayerReminderNotification {
  static void showPrayerReminderNotification() async {
    // Bildirim ayarlarını getir
    final prefs = await SharedPreferences.getInstance();
    final List<String>? notiSettingsString =
        prefs.getStringList("userNotiSettings");
    if (notiSettingsString == null) return;
    final List<PrayerNotiSettings> notiSettings = notiSettingsString
        .map((e) => PrayerNotiSettings.fromJson(jsonDecode(e)))
        .toList();

    // Namaz vakitlerini getir
    final List<PrayerSharedP>? prayerTimes =
        await PrayerTimesService.getPrayerTimesFromSharedPreferences();

    final DateTime now = DateTime.now();

    // Bugüne ait namaz vakitlerini filtrele
    final PrayerSharedP currentPrayer =
        PrayerTimesService.getPrayerByDay(prayerTimes!, now);

    int? advancedVoiceWarningTime;
    int? warningSoundId;

    // Sessiz Mod durumunu getir
    final bool silentMode =
        await UserSettingsService.getSilentModeSettingForBackgroundTask();

    bool silentEnabled = false;

    // Sıradaki namaz vaktini bul
    final index = currentPrayer.items.indexWhere((e) {
      // eğer sessiz mod aktifse
      if (silentMode) {
        final prayerDateTime = e.timeValue.parseTimeAsDateTime();
        final currentDateTime = DateTime(0, 0, 0, now.hour, now.minute);
        // ikisinin farkını dk olarak hesapla
        final diff = currentDateTime.difference(prayerDateTime).inMinutes;

        // Şimdiki zaman namaz vakti -5 dk ve +30 dk arasındaysa sessiz bildirim göster
        silentEnabled = diff >= -5 && diff <= 30;
        debugPrint("Sessiz Mod aktif mi: $silentEnabled");
      }

      bool value = false;

      // Namaza ait bildirim ayarlarını getir
      final PrayerNotiSettings currentPrayerSetting =
          notiSettings.singleWhere((s) => s.name == e.name);

      warningSoundId = currentPrayerSetting.warningSoundId;

      // Eğer bildirim ayarı etkinse vaktinde uyarı yap
      if (currentPrayerSetting.voiceWarningEnable) {
        // Zamanında uyarı
        if (e.timeValue == TimeOfDay.now().toHourMinString()) {
          debugPrint("Namaz vakti bildirim uyarısı");
          value = true;
        }
      }

      // Eğer bildirim ayarı etkinse vaktinden önce uyarı yap
      if (currentPrayerSetting.advancedWarningSoundsEnable) {
        // Kaç dakika önceden uyarılacak
        final int time = currentPrayerSetting.advancedVoiceWarningTime;

        // Önceden uyarı olduğu için şimdiki zamana [time] kadar ekleme yap
        final editedNotTime =
            TimeOfDay.now().convertToDateTime().add(Duration(minutes: time));

        // Vakitler aynı mı?
        if (e.timeValue.parseTime().toHourMinString() ==
            editedNotTime.toHourMinString()) {
          advancedVoiceWarningTime = time;
          debugPrint("Namaz vakti bildirim $time dk önceden uyarı");
          value = true;
        }
      }

      return value;
    });

    PrayerSharedPItem? activePrayer;

    if (index != -1) activePrayer = currentPrayer.items[index];

    if (activePrayer != null) {
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        ksPrayerReminderNotiChannel,
        'Ezan Vakti Hatırlatıcı',
        channelDescription: 'Ezan vakti hatırlatıcı bildirimi',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        color: kcPrimaryColor,
        channelShowBadge: false,
        category: AndroidNotificationCategory.event,
        visibility: NotificationVisibility.public,
        playSound: silentEnabled,
        sound: RawResourceAndroidNotificationSound(
          kaNotiSounds.singleWhere((e) => e.id == warningSoundId).rawPath,
        ),
      );

      NotificationDetails notificationDetails =
          NotificationDetails(android: androidNotificationDetails);

      final bool alertBefore = advancedVoiceWarningTime != null;

      final String? subtitle =
          alertBefore ? '$advancedVoiceWarningTime dk kaldı' : null;

      await PushNotification.instance.localNotiPlugin.show(
          2,
          '${activePrayer.name} Namazı ${alertBefore ? "Uyarısı" : "Vakti"}',
          subtitle,
          notificationDetails);
    }
  }
}
