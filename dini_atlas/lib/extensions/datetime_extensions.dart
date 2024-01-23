import 'package:flutter/material.dart';

extension DateTimeExtensions on DateTime {
  // İki tarih yıl, ay, gün bakımından eşit mi
  bool isEqualTo(DateTime date2) {
    return year == date2.year && month == date2.month && day == date2.day;
  }

  String differenceToString(DateTime other) {
    String formatTwoDigits(int number) => number.toString().padLeft(2, '0');
    Duration difference = this.difference(other);
    int hours = difference.inHours;
    int minutes = (difference.inMinutes % 60);
    int seconds = (difference.inSeconds % 60);

    return '${formatTwoDigits(hours)}:${formatTwoDigits(minutes)}:${formatTwoDigits(seconds)}';
  }
}

extension TimeOfDayExtensions on TimeOfDay {
  double toDouble() => hour + minute / 60.0;
  DateTime convertToDateTime() => DateTime(0, 0, 0, hour, minute);
}
