import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/controller/account_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/screen/profile_selection_screen.dart';

class AccountFormController extends GetxController {
  final AccountRepository _accountRepository = Get.find();
  final AccountFormViewModel _viewModel = Get.find();

  final formKey = GlobalKey<FormState>();

  Future saveAccount(AccountModel account) {
    return _accountRepository.save(account);
  }

  void submit() async {
    Get.focusScope.requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _accountRepository.save(_viewModel.buildForm());
      MainTabRouter.pop();
    }
  }

  void cancel() async {
    MainTabRouter.pop();
  }

  Future<ProfileModel> selectProfile() {
    return ProfileSelectionScreen.navigateTo();
  }
}
