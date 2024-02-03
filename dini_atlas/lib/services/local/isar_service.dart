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
      [UserSettingsSchema, PrayerTimesSchema, PrayerNotiSettingsSchema],
      directory: dir.path,
    );
    debugPrint("Isar Servisi Başlatıldı");

    // Vakit bildirim varsayılan ayarları yoksa oluştur.

    if ((await isar.prayerNotiSettings.where().findAll()).isEmpty) {
      await createDefaultPrayerNotiSettings();
    }
  }

  Future<void> createDefaultPrayerNotiSettings() async {
    debugPrint("Varsayılan vakit bildirim ayarları kaydedildi");
    for (var prayerType in PrayerType.values) {
      if (prayerType == PrayerType.all) continue;
      final value = PrayerNotiSettings()..name = prayerType.text;
      await isar.writeTxn(() async => await isar.prayerNotiSettings.put(value));
    }
  }
}
