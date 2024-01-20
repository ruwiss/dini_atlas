import 'package:dini_atlas/app/app.locator.dart';
import 'package:dini_atlas/models/prayer/eid_prayer.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/models/prayer/prayer_times.dart';
import 'package:dini_atlas/services/local/isar_service.dart';

class PrayerTimesException implements Exception {
  final String message;
  PrayerTimesException(this.message);
}

class PrayerTimesService {
  final _db = locator<IsarService>().isar;

  Future<PrayerTimes> getPrayerTimes() async {
    try {
      final currentPrayerTimes =
          await _db.prayerTimes.get(IsarService.prayerTimesKey);

      if (currentPrayerTimes == null) {
        throw PrayerTimesException(
            "Veritabanına kayıtlı vakit bilgisi bulunamadı.");
      }
      return currentPrayerTimes;
    } catch (e) {
      throw PrayerTimesException(e.toString());
    }
  }

  Future<void> setPrayerTimes({
    required List<PrayerTime> times,
    required EidPrayerTime eidTimes,
  }) async {
    try {
      // Nesne oluştur
      final prayerTimes = PrayerTimes()
        ..id = IsarService.prayerTimesKey
        ..prayerTimes = times
        ..eidPrayers = eidTimes
        ..lastFetch = DateTime.now();

      // Veritabanına kaydet
      await _db.writeTxn(() async => await _db.prayerTimes.put(prayerTimes));
    } catch (e) {
      throw PrayerTimesException(e.toString());
    }
  }
}
