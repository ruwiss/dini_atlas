import 'package:dini_atlas/models/prayer/prayer_times.dart';
import 'package:dini_atlas/models/user_setting.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

class IsarService {
  static const int userSettingsKey = 0;
  static const int prayerTimesKey = 1;

  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [UserSettingSchema, PrayerTimesSchema],
      directory: dir.path,
    );
  }
}
