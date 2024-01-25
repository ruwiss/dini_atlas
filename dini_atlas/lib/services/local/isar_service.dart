import 'package:dini_atlas/models/prayer/prayer_times.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

class IsarService {
  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UserSettingSchema, PrayerTimesSchema],
      directory: dir.path,
    );
    if (kDebugMode) print("Isar Servisi Başlatıldı");
  }
}
