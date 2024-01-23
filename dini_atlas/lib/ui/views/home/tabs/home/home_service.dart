import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/extensions/string_extensions.dart';
import 'package:dini_atlas/models/prayer/prayer_time.dart';
import 'package:dini_atlas/models/prayer/prayer_times.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'dart:async';

enum CurrentPrayerType { imsak, gunes, ogle, ikindi, aksam, yatsi }

class HomeService with ListenableServiceMixin {
  static final HomeService _singleton = HomeService._internal();
  factory HomeService() => _singleton;
  HomeService._internal();

  void listen() => listenToReactiveValues(
      [prayerTimes, nextTimeIsAfterDay, currentPrayerType, countdownTimer]);

  PrayerTimes? prayerTimes;
  bool nextTimeIsAfterDay = false;
  CurrentPrayerType? currentPrayerType;
  String? countdownTimer;

  PrayerTime getTimesByDay(DateTime date) {
    return prayerTimes!.prayerTimes.singleWhere(
      (e) => e.miladiTarihUzunIso8601.isEqualTo(date),
    );
  }

  void calculatePrayerTime() async {
    final now = DateTime.now();
    final currentPrayer = getTimesByDay(now);

    // Vakitler
    final List<String> times = [
      currentPrayer.imsak,
      currentPrayer.gunes,
      currentPrayer.ogle,
      currentPrayer.ikindi,
      currentPrayer.aksam,
      currentPrayer.yatsi,
    ];

    // Sıradaki namaz vakti
    final String nextPrayerTime = times.firstWhere(
      (e) {
        double tCurrent = e.parseTime().toDouble();
        double tNow = TimeOfDay.now().toDouble();

        return tCurrent > tNow;
      },
      orElse: () {
        nextTimeIsAfterDay = true;
        return getTimesByDay(now.add(const Duration(days: 1))).imsak;
      },
    );

    if (kDebugMode) {
      print("Sıradaki vakit: $nextPrayerTime");
      print("nextTimeIsAfterDay: $nextTimeIsAfterDay");
    }
    if (nextTimeIsAfterDay) {
      currentPrayerType = CurrentPrayerType.imsak;
    } else {
      final int nextIndex = times.indexOf(nextPrayerTime);
      int currentIndex = nextIndex - 1;
      if (currentIndex.isNegative) currentIndex = 5;
      currentPrayerType = switch (currentIndex) {
        0 => CurrentPrayerType.imsak,
        1 => CurrentPrayerType.gunes,
        2 => CurrentPrayerType.ogle,
        3 => CurrentPrayerType.ikindi,
        4 => CurrentPrayerType.aksam,
        5 => CurrentPrayerType.yatsi,
        _ => null,
      };
    }

    startCountdownTimer(nextPrayerTime);
  }

  void startCountdownTimer(String time) async {
    // Vakit namaz saatini datetime'a çevir
    DateTime current = time.parseTime().convertToDateTime();

    // Eğer sonraki gün ise mevcut zamana +1 gün ekle
    if (nextTimeIsAfterDay) current = current.add(const Duration(days: 1));

    // Geri sayımı başlat
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final DateTime now = DateTime.now();

      // Mevcut zamanı yıl, ay, gün olmadan datetime'a çevir
      final DateTime nowAsTime =
          DateTime(0, 0, 0, now.hour, now.minute, now.second);

      // İkisinin farkını string formatında al ve state'e kaydet
      countdownTimer = current.differenceToString(nowAsTime);
      notifyListeners();

      // Eğer geri sayım durduysa yeni vakit için tekrar hesap yap
      if (countdownTimer == "00:00:00") {
        timer.cancel();
        calculatePrayerTime();
      }
    });
  }
}
