import 'package:flutter/material.dart';

extension StringTimeExtensions on String {
  TimeOfDay parseTime() {
    List<String> timeList = split(':');
    int hour = int.parse(timeList[0]);
    int min = int.parse(timeList[1]);

    return TimeOfDay(hour: hour, minute: min);
  }

  DateTime parseTimeAsDateTime() {
    return DateTime(0, 0, 0, parseTime().hour, parseTime().minute);
  }

  /// Capitalize first letter of the String
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Arapça okunuştaki harfleri düzelt
  String fixLatinArabicLetters() {
    return replaceAll("ḥ", "h")
        .replaceAll("ḫ", "h")
        .replaceAll("ṣ", "s")
        .replaceAll("ṭ", "t")
        .replaceAll("ḳ", "k")
        .replaceAll("ẕ", "z")
        .replaceAll("ḍ", "d")
        .replaceAll("ŝ", "s");
  }
}
