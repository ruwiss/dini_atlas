import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:dini_atlas/services/local/prayer_times_service.dart';
import 'package:dini_atlas/services/notification/push_notification.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

abstract class PrayerNotification {
  static void showPrayerCountdownNotification() async {
    final result = await PrayerTimesService.calculateSharedPrefNextPrayerTime();

    if (result == null) return;

    DateTime prayerTime = result.item.timeValue.parseTime().convertToDateTime();
    if (result.isNextDay) prayerTime = prayerTime.add(const Duration(days: 1));

    final DateTime now = DateTime.now();
    final DateTime nowAsTime = DateTime(0, 0, 0, now.hour, now.minute);

    // Sıradaki namaza ne kadar kaldı hesapla
    final difference =
        prayerTime.differenceToStringForPushNotification(nowAsTime);
    final differenceMinutes =
        prayerTime.differenceToStringMinutesForPushNotification(nowAsTime);

    final subText = result.item.name != PrayerType.imsak.name
        ? '${result.item.name} ${result.item.timeValue}'
        : null;
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      ksPrayerNotiChannel,
      'Dini Atlas Ezan Vakti',
      channelDescription: 'Ezan vakti bildirim göstergesi',
      icon: differenceMinutes <= 60 ? '@drawable/dk$differenceMinutes' : null,
      subText: subText,
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
