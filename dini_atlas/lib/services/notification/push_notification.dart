import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:dini_atlas/services/remote/google/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'prayer_notification.dart';
import 'prayer_reminder_notification.dart';

// Dakikalık background-task
@pragma('vm:entry-point')
void everyMinuteNotificationController() {
  // Namaza kaç dk kaldığını gösteren push bildirim
  PrayerNotification.showPrayerCountdownNotification();
  // Namaz vakti hatırlatıcı ek bildirim
  PrayerReminderNotification.showPrayerReminderNotification();
}

class PushNotification {
  PushNotification._singleton();
  static final PushNotification _instance = PushNotification._singleton();
  static PushNotification get instance => _instance;

  final localNotiPlugin = FlutterLocalNotificationsPlugin();

  Future<bool> _requestPermission() async {
    return await localNotiPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()!
            .requestNotificationsPermission() ??
        false;
  }

  Future<void> setupNotification() async {
    if (await _requestPermission()) {
      await localNotiPlugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('ic_stat_noti'),
        ),
      );
      await AndroidAlarmManager.periodic(
        const Duration(minutes: 1),
        1,
        everyMinuteNotificationController,
        exact: true,
        rescheduleOnReboot: true,
        allowWhileIdle: true,
      );

      await FirebaseMessagingService.initFirebaseNotifications();
    }
  }
}
