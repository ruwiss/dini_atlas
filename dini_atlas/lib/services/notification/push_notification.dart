import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
    }
  }
}
