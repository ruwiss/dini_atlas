import 'package:dini_atlas/ui/common/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// DateTime Extensions
extension DateTimeExtensions on DateTime {
  // İki tarih yıl, ay, gün bakımından eşit mi
  bool isEqualTo(DateTime date2) {
    return year == date2.year && month == date2.month && day == date2.day;
  }

  // Iki tarih farkı String olarak [00:00:00] formatında döndürür
  String differenceToString(DateTime other) {
    String formatTwoDigits(int number) => number.toString().padLeft(2, '0');
    Duration difference = this.difference(other);
    int hours = difference.inHours;
    int minutes = (difference.inMinutes % 60);
    int seconds = (difference.inSeconds % 60);

    return '${formatTwoDigits(hours)}:${formatTwoDigits(minutes)}:${formatTwoDigits(seconds)}';
  }

  // Verilen tarihi [Cumartesi, Ocak 09] formatına döndürür
  String formatAsWeekMonthDay() {
    final formatter = DateFormat('EEEE, MMMM dd', ksDefaultLocale);
    String formattedDate = formatter.format(this);
    return formattedDate;
  }
}

// TimeOfDay Extensions
extension TimeOfDayExtensions on TimeOfDay {
  // TimeOfDay objesini double formatına döndürür
  double toDouble() => hour + minute / 60.0;

  // TimeOfDay objesini DateTime formatına döndürur
  DateTime convertToDateTime() => DateTime(0, 0, 0, hour, minute);
}
