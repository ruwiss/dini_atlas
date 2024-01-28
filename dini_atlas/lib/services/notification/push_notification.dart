import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_shared_p.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PushNotification {
  PushNotification._singleton();
  static final PushNotification _instance = PushNotification._singleton();
  static PushNotification get instance => _instance;

  final _localNotiPlugin = FlutterLocalNotificationsPlugin();

  Future<bool> _requestPermission() async {
    return await _localNotiPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()!
            .requestNotificationsPermission() ??
        false;
  }

  Future<void> setupNotification() async {
    if (await _requestPermission()) {
      _localNotiPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('ic_stat_noti'),
        ),
        onDidReceiveNotificationResponse: (details) {},
      );
    }
  }

  Future<List<PrayerSharedP>?> _getPrayerTimeFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final timeStr = prefs.getStringList('prayerTimes');

    if (timeStr == null) return null;

    return timeStr.map((e) => PrayerSharedP.fromSharedPrefItem(e)).toList();
  }

  PrayerSharedP getPrayerByDay(List<PrayerSharedP> times, DateTime date) {
    return times.singleWhere((e) => e.date.isEqualTo(date));
  }

  Future<void> showPrayerCountdownNotification(String text) async {
    final List<PrayerSharedP>? prayerTimes =
        await _getPrayerTimeFromSharedPreferences();

    if (prayerTimes == null) return;

    final DateTime now = DateTime.now();

    // Bugünün vakitleri
    final currentDay = getPrayerByDay(prayerTimes, now);

    // Sıradaki namaz vakti
    final PrayerSharedPItem nextPrayer = currentDay.items.firstWhere(
      (e) {
        double tCurrent = e.timeValue.parseTime().toDouble();
        double tNow = TimeOfDay.now().toDouble();
        return tCurrent > tNow;
      },
      orElse: () {
        // Vakit sonraki güne ait, o zaman imsak vaktini döndür
        return getPrayerByDay(prayerTimes, now.add(const Duration(days: 1)))
            .items
            .singleWhere((e) => e.name == "İmsak");
      },
    );

    final DateTime nowAsTime =
        DateTime(0, 0, 0, now.hour, now.minute, now.second);

    DateTime prayerTime = nextPrayer.timeValue.parseTime().convertToDateTime();

    // Sıradaki namaza ne kadar kaldı hesapla
    final difference =
        prayerTime.differenceToStringForPushNotification(nowAsTime);

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      ksPrayerNotiChannel,
      'Dini Atlas Ezan Vakti',
      channelDescription: 'Ezan vakti bildirim göstergesi',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      color: kcPrimaryColor,
      playSound: false,
      ongoing: true,
      enableVibration: false,
      channelShowBadge: false,
      autoCancel: false,
      category: AndroidNotificationCategory.event,
    );
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _localNotiPlugin.show(
        1,
        '${nextPrayer.name} ${nextPrayer.timeValue}  >>  $difference',
        null,
        notificationDetails);
  }
}
