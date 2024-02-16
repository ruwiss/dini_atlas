import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_remote_config_service.dart';
import 'package:flutter/widgets.dart';

abstract class GoogleServices {
  static Future<void> init() async {
    await FirebaseRemoteConfigServiceClass.i.init();
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    await _setCrashlytics();
  }

  static Future<void> _setCrashlytics() async {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  static void recordError(Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  }

  static Future<void> initFirebaseNotifications() async {
    final firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();

    debugPrint("Firebase Messaging Token: $fcmToken");
  }
}
