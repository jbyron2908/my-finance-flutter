import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/screen/payee_form_screen.dart';

class PayeeListController extends GetxController {
  final PayeeRepository _payeeRepository = Get.find();

  Future deletePayee(PayeeModel payee) {
    return _payeeRepository.delete(payee);
  }

  void editPayee(PayeeModel payee) {
    PayeeFormScreen.navigateTo(PayeeFormArg.edit(payee));
  }
}
