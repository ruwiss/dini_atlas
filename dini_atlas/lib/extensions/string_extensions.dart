import 'package:dini_atlas/extensions/datetime_extensions.dart';
import 'package:dini_atlas/ui/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringTimeExtensions on String {
  TimeOfDay parseTime() {
    List<String> timeList = split(':');
    int hour = int.parse(timeList[0]);
    int min = int.parse(timeList[1]);

    return TimeOfDay(hour: hour, minute: min);
  }

  // Verilen [16 Haziran 2024 Pazar] şeklindeki tarihi DateTime'a döndürür
  DateTime convertStringTimeToDateTime() {
    final format = DateFormat('dd MMMM y EEEE', ksDefaultLocale);
    return format.parse(this);
  }

  String parseDateTimeStringAsString() {
    return DateTime.parse(this).convertDMYtimeString();
  }

  // [HH:mm:ss] -> [HH:mm]
  String parseTimeAsString() {
    final old = DateFormat('HH:mm:ss').parse(this);
    return DateFormat('HH:mm').format(old);
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

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  String delFromBeginAndEndIfAvailable(String char) {
    return replaceAll(RegExp('^"|"\$'), "").trim();
  }

  String toLowerCaseTurkish() {
    String result = "";
    for (var char in characters) {
      switch (char) {
        case 'I':
          result += 'ı';
          break;
        case 'İ':
          result += 'i';
          break;
        case 'Ğ':
          result += 'ğ';
        case 'Ü':
          result += 'ü';
        case 'Ö':
          result += 'ö';
        case 'Ş':
          result += 'ş';
        case 'Ç':
          result += 'ç';
        default:
          result += char.toLowerCase();
      }
    }
    return result;
  }

  String removeHtmlTags() => replaceAll(RegExp(r'<[^>]*>'), '');
}
