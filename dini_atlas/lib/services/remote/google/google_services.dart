import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'firebase_remote_config_service.dart';
import 'package:flutter/widgets.dart';

import 'dart:async';
import 'dart:developer';

import 'in_app_purchase_service.dart';

abstract class GoogleServices {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static Future<void> init() async {
    final stopwatch = Stopwatch()..start();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    log("Firebase initialized: ${stopwatch.elapsedMilliseconds} ms");
    await FirebaseRemoteConfigServiceClass.i.init();
    log("Firebase Remote Config initialized: ${stopwatch.elapsedMilliseconds} ms");
    await _setCrashlytics();
    log("Crashlytics record errors: ${stopwatch.elapsedMilliseconds} ms");
    await locator<InAppPurchaseService>().init();
    log("In App Purchases initialized: ${stopwatch.elapsedMilliseconds} ms");
    unawaited(MobileAds.instance.initialize());
    log("Mobile Ads initialized: ${stopwatch.elapsedMilliseconds} ms");
    stopwatch.stop();

    FirebaseAnalytics.instance.logAppOpen();
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
