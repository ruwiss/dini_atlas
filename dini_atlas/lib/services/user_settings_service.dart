import 'dart:convert';

import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/user_location.dart';
import 'package:dini_atlas/models/user_setting/user_setting.dart';
import 'package:dini_atlas/services/isar_service.dart';
import 'package:isar/isar.dart';

class UserSettingsService {
  static const String userLocationKey = "userLocation";

  final _db = locator<IsarService>().isar;

  Future<UserLocation?> getUserLocation() async {
    final currentLocation = await _db.userSettings
        .buildQuery<UserSetting>(
          filter: const FilterCondition.equalTo(
              property: "key", value: userLocationKey),
        )
        .findFirst();
    if (currentLocation == null) return null;
    return UserLocation.fromJson(jsonDecode(currentLocation.jsonString));
  }

  Future<void> setUserLocation(UserLocation location) async {
    // Varsa [userLocationKey] verisini getir
    final currentLocation = await _db.userSettings
        .buildQuery<UserSetting>(
          filter: const FilterCondition.equalTo(
              property: "key", value: userLocationKey),
        )
        .findFirst();

    final jsonString = jsonEncode(location);
    late UserSetting userSetting;

    // Veri kayıtlı mı
    if (currentLocation == null) {
      // değilse yeni oluştur
      userSetting = UserSetting()
        ..key = userLocationKey
        ..jsonString = jsonString;
    } else {
      // kayıtlıysa değiştir
      userSetting = currentLocation..jsonString = jsonString;
    }

    // Veriyi kaydet
    _db.writeTxn(() => _db.userSettings.put(userSetting));
  }
}
