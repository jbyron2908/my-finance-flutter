import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_screen.dart';

class AccountListController extends GetxController {
  final AccountRepository _accountRepository = Get.find();

  Future deleteAccount(AccountModel account) {
    return _accountRepository.delete(account);
  }

  void editAccount(AccountModel account) {
    AccountFormScreen.navigateTo(
      AccountFormArg.edit(account),
    );
  }
}
