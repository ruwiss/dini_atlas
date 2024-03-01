import 'dart:math';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:dini_atlas/services/local/app_widget_service.dart';
import 'package:dini_atlas/services/remote/google/google_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'prayer_notification.dart';
import 'prayer_reminder_notification.dart';

// Dakikalık background-task
@pragma('vm:entry-point')
void periodicTimerController() async {
  final prefs = await SharedPreferences.getInstance();
  final bool alarmMode = prefs.getBool('alarmMode') ?? true;
  // Alarm mod etkin ise kendini tekrarla
  if (alarmMode) {
    final alarmId = AppNotifications.alarmModeId;
    await AndroidAlarmManager.oneShot(
      const Duration(minutes: 1),
      alarmId,
      periodicTimerController,
      alarmClock: true,
      exact: true,
      allowWhileIdle: true,
      rescheduleOnReboot: true,
    );

    await prefs.setStringList(
      "alarmIds",
      [...prefs.getStringList('alarmIds') ?? [], "$alarmId"],
    );

    debugPrint("Alarm Fired: $alarmId");
  } else {
    debugPrint("Periodic Fired");
  }
  // Namaza kaç dk kaldığını gösteren push bildirim
  await PrayerNotification.showPrayerCountdownNotification();
  // Namaz vakti hatırlatıcı ek bildirim
  await PrayerReminderNotification.showPrayerReminderNotification();
  // Update Home Widgets
  await AppWidgetService.updateHomeWidgetsIfAvailable();
}

class AppNotifications {
  AppNotifications._singleton();
  static final AppNotifications _instance = AppNotifications._singleton();
  static AppNotifications get instance => _instance;

  final localNotiPlugin = FlutterLocalNotificationsPlugin();
  static const int normalModeId = 2;
  static int get alarmModeId => Random().nextInt(pow(2, 31) as int);

  bool _enabled = false;

  Future<bool> _requestPermission() async {
    return await localNotiPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()!
            .requestNotificationsPermission() ??
        false;
  }

  Future<void> setupNotification() async {
    if (await _requestPermission() && !_enabled) {
      await localNotiPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('ic_stat_noti'),
        ),
      );
      await AndroidAlarmManager.initialize();
      await Permission.scheduleExactAlarm.request();

      final prefs = await SharedPreferences.getInstance();
      final bool alarmMode = prefs.getBool('alarmMode') ?? true;

      if (alarmMode) {
        await _cancelAllAlarms();
        final alarmId = alarmModeId;
        await AndroidAlarmManager.oneShot(
          const Duration(minutes: 1),
          alarmId,
          periodicTimerController,
          alarmClock: true,
          exact: true,
          allowWhileIdle: true,
          rescheduleOnReboot: true,
        );
        await prefs.setStringList("alarmIds", ["$alarmId"]);
        debugPrint("Alarm Notification Mode Activated");
      } else {
        await AndroidAlarmManager.periodic(
          const Duration(seconds: 60),
          normalModeId,
          periodicTimerController,
          exact: true,
          rescheduleOnReboot: true,
          allowWhileIdle: true,
        );
        debugPrint("Normal Notification Mode Activated");
      }

      await GoogleServices.initFirebaseNotifications();

      _enabled = true;
    }
  }

  Future<void> _cancelAllAlarms() async {
    final prefs = await SharedPreferences.getInstance();
    for (String i in prefs.getStringList('alarmIds') ?? []) {
      final int id = int.parse(i);
      AndroidAlarmManager.cancel(id);
    }
    AndroidAlarmManager.cancel(normalModeId);
  }

  Future<void> setAlarmMode(bool value) async {
    // Eğer alarm modu değilse ve alarm yapılacaksa önceki process'i kapat
    await _cancelAllAlarms();
    _enabled = false;
    await setupNotification();
  }
}
