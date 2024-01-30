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

  // Iki tarih farkı String olarak [1 sa 2 dk] olarak döndürür
  String differenceToStringForPushNotification(DateTime other) {
    Duration difference = this.difference(other);
    int hours = difference.inHours;
    int minutes = (difference.inMinutes % 60);

    String text = "$minutes dk";
    if (hours > 0) text = "$hours sa $minutes dk";
    return text;
  }

  // Verilen tarihi [Cumartesi, Ocak 09] formatına döndürür
  String formatAsWeekMonthDay() {
    final formatter = DateFormat('EEEE, MMMM dd', ksDefaultLocale);
    String formattedDate = formatter.format(this);
    return formattedDate;
  }

  // DateTime objesini TimeOfDay objesine döndürür
  TimeOfDay toTimeOfDay() => TimeOfDay(hour: hour, minute: minute);

  // DateTime objesini [00:00] String formatına döndürür
  String toHourMinString() => "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
}

// TimeOfDay Extensions
extension TimeOfDayExtensions on TimeOfDay {
  // TimeOfDay objesini double formatına döndürür
  double toDouble() => hour + minute / 60.0;

  // TimeOfDay objesini DateTime formatına döndürür
  DateTime convertToDateTime() => DateTime(0, 0, 0, hour, minute);

  // TimeOfDay objesini [00:00] String formatına döndürür
  String toHourMinString () => "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
}
