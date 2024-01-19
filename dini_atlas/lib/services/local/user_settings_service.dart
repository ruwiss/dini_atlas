import 'dart:convert';

import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/user_location.dart';
import 'package:dini_atlas/models/user_setting/user_setting.dart';
import 'package:dini_atlas/services/local/isar_service.dart';

class UserSettingsService {
  static const int userLocationKey = 0;

  final _db = locator<IsarService>().isar;

  Future<UserLocation?> getUserLocation() async {
    final currentLocation = await _db.userSettings.get(userLocationKey);
    if (currentLocation == null) return null;
    return UserLocation.fromJson(jsonDecode(currentLocation.jsonString));
  }

  Future<void> setUserLocation(UserLocation location) async {
    // Nesne oluştur
    final jsonString = jsonEncode(location);
    final userSetting = UserSetting()
      ..id = userLocationKey
      ..jsonString = jsonString;

    // Veriyi kaydet
    _db.writeTxn(() => _db.userSettings.put(userSetting));
  }
}
