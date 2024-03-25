import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/firebase_options.dart';
import 'package:dini_atlas/services/remote/dio_service.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:feedback/feedback.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'firebase_remote_config_service.dart';

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

    // Önce InAppSubscription çalıştır, ardından reklam servisini çalıştır
    // Reklam kaldırıldıysa, boşa reklam yüklemesi yapmasın diye
    unawaited(locator<InAppPurchaseService>().init(
      onInit: () => unawaited(MobileAds.instance.initialize()),
    ));

    stopwatch.stop();
    FirebaseAnalytics.instance
        .setAnalyticsCollectionEnabled(true)
        .then((_) async {
      await FirebaseAnalytics.instance
          .setDefaultEventParameters({"app_version": ksAppVersion});
      FirebaseAnalytics.instance.logAppOpen();
    });
  }

  static Future<void> _setCrashlytics() async {
    if (kDebugMode) return;
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  static void recordError(Object error, StackTrace stack) {
    if (kDebugMode) return;
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  }

  static Future<void> initFirebaseNotifications() async {
    final firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();

    debugPrint("Firebase Messaging Token: $fcmToken");
  }

  static Future<void> uploadUserFeedBack(
      UserFeedback feedback, String? email) async {
    try {
      String text = feedback.text;
      if (email != null) text = "E-Posta: $email\n\n$text";
      FormData formData = FormData.fromMap({
        "image": MultipartFile.fromBytes(feedback.screenshot,
            filename: "feedback.png"),
        "text": text,
      });

      await locator<DioService>()
          .request("/feedback", data: formData, method: DioMethod.post);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
