import 'package:form_field_validator/form_field_validator.dart';

class CurrencyNotZeroValidator extends TextFieldValidator {
  CurrencyNotZeroValidator({String errorText = "Required"}) : super(errorText);

  @override
  bool get ignoreEmptyValues => true;

  @override
  bool isValid(String value) {
    var currencyValue = double.parse(value);
    return currencyValue > 0;
  }
}
