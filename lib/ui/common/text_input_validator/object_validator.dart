import 'package:form_field_validator/form_field_validator.dart';

class ObjectRequiredValidator extends FieldValidator<Object> {
  ObjectRequiredValidator({String errorText = 'Required'}) : super(errorText);

  @override
  bool isValid(Object value) {
    return value != null;
  }
}
