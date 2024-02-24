import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_shared_p.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/notification/push_notification.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class PrayerNotification {
  static void showPrayerCountdownNotification() async {
    final List<PrayerSharedP>? prayerTimes =
        await PrayerTimesService.getPrayerTimesFromSharedPreferences();

    if (prayerTimes == null) return;

    final DateTime now = DateTime.now();
    final DateTime nowAsTime = DateTime(0, 0, 0, now.hour, now.minute);

    // Mevcut namaz sonraki gün mü?
    bool isNextDay = false;

    // Bugünün vakitleri
    final currentDay = PrayerTimesService.getPrayerByDay(prayerTimes, now);

    // Sıradaki namaz vakti
    final PrayerSharedPItem nextPrayer = currentDay.items.firstWhere(
      (e) {
        double tCurrent = e.timeValue.parseTime().toDouble();
        double tNow = TimeOfDay.now().toDouble();
        return tCurrent > tNow;
      },
      orElse: () {
        // Vakit sonraki güne ait, o zaman imsak vaktini döndür
        isNextDay = true;
        return PrayerTimesService.getPrayerByDay(
                prayerTimes, now.add(const Duration(days: 1)))
            .items
            .singleWhere((e) => e.name == "İmsak");
      },
    );

    DateTime prayerTime = nextPrayer.timeValue.parseTime().convertToDateTime();
    if (isNextDay) prayerTime = prayerTime.add(const Duration(days: 1));

    // Sıradaki namaza ne kadar kaldı hesapla
    final difference =
        prayerTime.differenceToStringForPushNotification(nowAsTime);
    final differenceMinutes =
        prayerTime.differenceToStringMinutesForPushNotification(nowAsTime);
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      ksPrayerNotiChannel,
      'Dini Atlas Ezan Vakti',
      channelDescription: 'Ezan vakti bildirim göstergesi',
      icon: differenceMinutes <= 60 ? '@drawable/dk$differenceMinutes' : null,
      subText: '${nextPrayer.name} ${nextPrayer.timeValue}',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      color: kcPrimaryColor,
      playSound: false,
      ongoing: true,
      enableVibration: false,
      channelShowBadge: false,
      autoCancel: false,
      silent: true,
      category: AndroidNotificationCategory.event,
      visibility: NotificationVisibility.public,
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await PushNotification.instance.localNotiPlugin
        .show(1, '$difference kaldı.', null, notificationDetails);
  }
}
