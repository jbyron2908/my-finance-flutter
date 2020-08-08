import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_screen.dart';

class PayeeFormViewModel extends GetxController {
  final RxString name = ''.obs;

  PayeeFormArg argument;

  void setArgument(PayeeFormArg argument) {
    this.argument = argument;
    var payee = argument.payee;

    name.value = payee.name;
  }

  PayeeModel buildForm() {
    var payee = argument.payee;

    return payee.copyWith(
      name: name.value,
    );
  }
}
