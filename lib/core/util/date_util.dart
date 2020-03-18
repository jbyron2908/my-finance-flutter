import 'package:flutter/material.dart';

class DateUtil {
  static DateTime today() {
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  static DateTime mergeDateAndTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }
}
