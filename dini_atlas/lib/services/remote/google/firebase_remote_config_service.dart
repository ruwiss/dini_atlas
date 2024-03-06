import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class FirebaseRemoteConfigServiceClass {
  FirebaseRemoteConfigServiceClass._singleton();
  static final _i = FirebaseRemoteConfigServiceClass._singleton();
  static FirebaseRemoteConfigServiceClass get i => _i;

  final String _hostKey = "host";
  final String _mailKey = "mail";
  final String _securityKey = "security_key";
  final String _immediateUpdateVersionKey = "immediate_update_version";
  final String _gitlabProjectIdKey = "gitlab_project_id";
  final String _gitlabApiTokenKey = "gitlab_api_token";
  final String _elifbaKey = "elifba";
  final String _privacyPolicyKey = "privacy_policy";

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  String get host => _remoteConfig.getString(_hostKey);
  String get mail => _remoteConfig.getString(_mailKey);
  String get securityKey => _remoteConfig.getString(_securityKey);
  int get immediateUpdateVersion =>
      _remoteConfig.getInt(_immediateUpdateVersionKey);
  String get gitlabProjectId => _remoteConfig.getString(_gitlabProjectIdKey);
  String get gitlabApiToken => _remoteConfig.getString(_gitlabApiTokenKey);
  String get elifba => _remoteConfig.getString(_elifbaKey);
  String get privacyPolicy => _remoteConfig.getString(_privacyPolicyKey);

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
          _hostKey: "https://api.kodlayalim.net/diniatlas",
          _elifbaKey: "https://api.kodlayalim.net/elifba",
          _securityKey: "V47R3JNT",
          _immediateUpdateVersionKey: 1,
          _gitlabProjectIdKey: "55056853",
          _gitlabApiTokenKey: "glpat-eQXXQp-mRMQ_tTXBs5se",
          _privacyPolicyKey: "https://belge.kodlayalim.net/diniatlas.html",
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
