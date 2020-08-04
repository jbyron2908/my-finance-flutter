import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_screen.dart';

class AccountFormViewModel extends ChangeNotifier {
  AccountFormViewModel() {
    AccountFormArg arguments = Get.arguments;
    account = arguments.account;
  }

  AccountModel _account;

  AccountModel get account => _account;

  set account(AccountModel account) {
    _account = account;
    notifyListeners();
  }

  void update({
    String name,
    String type,
    ProfileModel profile,
  }) {
    account = _account.copyWith(
      name: name ?? _account.name,
      type: type ?? _account.type,
      profile: profile ?? _account.profile,
    );
  }
}
