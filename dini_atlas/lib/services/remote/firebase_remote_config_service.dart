import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class FirebaseRemoteConfigServiceClass {
  FirebaseRemoteConfigServiceClass._singleton();
  static final _i = FirebaseRemoteConfigServiceClass._singleton();
  static FirebaseRemoteConfigServiceClass get i => _i;

  final String _hostKey = "host";
  final String _privacyPolicyKey = "privacy_policiy";
  final String _mailKey = "mail";

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  String get host => _remoteConfig.getString(_hostKey);
  String get privacyPolicy => _remoteConfig.getString(_privacyPolicyKey);
  String get mail => _remoteConfig.getString(_mailKey);

  Future<void> init() async {
    await _setConfigSettings();
    await _setDefaults();
    await _fetchAndActivate();
  }

  Future<void> _setConfigSettings() async => _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 15), // zaman aşımı
          minimumFetchInterval: const Duration(hours: 12), // cache süresi
        ),
      );

  Future<void> _setDefaults() async => _remoteConfig.setDefaults(
        {
          _hostKey: "https://diniatlas.kodlayalim.net",
          _privacyPolicyKey:
              "https://docs.kodlayalim.net/diniatlas_privacy.html",
          _mailKey: "omer670067@gmail.com"
        },
      );

  Future<void> _fetchAndActivate() async {
    final bool updated = await _remoteConfig.fetchAndActivate();

    if (updated) {
      debugPrint('Firebase Remote Config: (Updated)');
    } else {
      debugPrint('Firebase Remote Config..');
    }
  }
}
