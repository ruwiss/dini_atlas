import 'package:flutter/material.dart';

extension StringTimeExtensions on String {
  TimeOfDay parseTime() {
    List<String> timeList = split(':');
    int hour = int.parse(timeList[0]);
    int min = int.parse(timeList[1]);

    return TimeOfDay(hour: hour, minute: min);
  }

  /// Capitalize first letter of the String
  String capitalize() {
  if (isEmpty)  return this;
  return this[0].toUpperCase() + substring(1);
}

}
