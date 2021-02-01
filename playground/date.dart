import 'package:my_finance_flutter/core/util/date_util.dart';
import 'package:time/time.dart';

void main2() {
  var now = DateTime.now();
  var oneWeekLater = now + 1.weeks;
  var moth12 = now.copyWith(
    microsecond: 0,
    millisecond: 0,
    second: 0,
    minute: 0,
    hour: 0,
    day: 1,
    month: now.month - 6,
  );

  print('Now - ${now.toIso8601String()}');
  print('One week later - ${oneWeekLater.toIso8601String()}');
  print('Moth12 - ${moth12.toIso8601String()}');
}

void main() {
  var howManyDaysInTheMonth = DateUtil.howManyDaysInTheMonth(
    DateTime(2020, 11),
  );
  print(howManyDaysInTheMonth);
}
