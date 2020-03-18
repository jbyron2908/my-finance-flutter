import 'package:flutter/material.dart';

class DateUtil {
  static DateTime today() {
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime setDateTime(DateTime date, int hour, int minute) {
    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  static DateTime mergeDateAndTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
