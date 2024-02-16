import 'firebase_remote_config_service.dart';

abstract class GoogleServices {
  static Future<void> init() async {
    await FirebaseRemoteConfigServiceClass.i.init();
  }
}
