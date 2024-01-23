import 'package:dini_atlas/services/local/isar_service.dart';
import 'package:dini_atlas/models/prayer/prayer_times.dart';
import 'package:dini_atlas/app/app.locator.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';

class PrayerTimesException implements Exception {
  final String message;
  PrayerTimesException(this.message);
}

class PrayerTimesService {
  final _db = locator<IsarService>().isar;
  PrayerTimes? prayerTimes;

  bool checkIsTimesUpToDate(PrayerTimes prayerTimes) {
    final lastFetch = prayerTimes.lastFetch;
    final now = DateTime.now();

    // iki tarih arasındaki farkı hesapla
    final diff = now.difference(lastFetch);

    // 1 aydan fazla fark var mı kontrol et ve döndür
    final bool isUpToDate = diff.inDays < 30;

    if (kDebugMode) print("Vakitler güncel mi: $isUpToDate");
    return isUpToDate;
  }

  Future<Either<PrayerTimes, bool>> getPrayerTimes() async {
    try {
      if (prayerTimes != null) return Left(prayerTimes!);

      // locale kayıtlı vakitleri getir
      PrayerTimes? currentPrayerTimes = await _db.prayerTimes.get(1);

      if (kDebugMode) {
        print("Mevcut namaz vakitleri: ${currentPrayerTimes?.lastFetch}");
      }

      // eğer locale kayıtlı vakitler yoksa (sorun oluştuysa)
      if (currentPrayerTimes == null) return const Right(true);

      // eğer vakitler güncel değilse
      if (!checkIsTimesUpToDate(currentPrayerTimes)) {
        return const Right(true);
      }

      prayerTimes = currentPrayerTimes;
      return Left(currentPrayerTimes);
    } catch (e) {
      throw PrayerTimesException(e.toString());
    }
  }

  Future<void> setPrayerTimes(PrayerTimes prayerTimes) async {
    try {
      // Veritabanına kaydet
      await _db.writeTxn(() async => await _db.prayerTimes.clear());
      await _db.writeTxn(() async => await _db.prayerTimes.put(prayerTimes));
    } catch (e) {
      throw PrayerTimesException(e.toString());
    }
  }
}
