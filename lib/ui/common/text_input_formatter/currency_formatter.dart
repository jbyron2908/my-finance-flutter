import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyFormatter {
  static TextInputFormatter build({
    String currencyPattern = "00.00",
    String separator = ".",
  }) =>
      TextInputFormatter.withFunction(
        (oldValue, newValue) {
          final noDots = newValue.text.replaceAll(separator, "");
          final number = int.parse(noDots) / 100;
          final formarter = NumberFormat(currencyPattern);
          final result = formarter.format(number);
          return TextEditingValue(
            text: result,
            selection: TextSelection.fromPosition(
              TextPosition(offset: result.length),
            ),
          );
        },
      );
}
