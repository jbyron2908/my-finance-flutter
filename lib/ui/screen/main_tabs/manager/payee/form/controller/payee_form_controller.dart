import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/controller/payee_form_view_model.dart';

class PayeeFormController extends GetxController {
  final PayeeFormViewModel _viewModel = Get.find();
  final PayeeRepository _payeeRepository = Get.find();

  final formKey = GlobalKey<FormState>();

  void submit() async {
    Get.focusScope.requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _payeeRepository.save(_viewModel.buildForm());
      MainTabRouter.pop();
    }
  }

  void cancel() async {
    MainTabRouter.pop();
  }
}
