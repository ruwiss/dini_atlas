import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'firebase_remote_config_service.dart';
import 'package:flutter/widgets.dart';

abstract class GoogleServices {
  static Future<void> init() async {
    await FirebaseRemoteConfigServiceClass.i.init();
    await _setCrashlytics();
  }

  static Future<void> _setCrashlytics() async {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  static void recordError(Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  }
}
