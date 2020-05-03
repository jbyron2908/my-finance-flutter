import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:provider/src/provider.dart';

class AccountFormViewModel extends ChangeNotifier {
  static AccountFormViewModel of(BuildContext context) =>
      Provider.of<AccountFormViewModel>(context);

  AccountFormViewModel(AccountModel account) {
    this.account = account;
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
      name: name,
      type: type,
      profile: profile,
    );
  }
}
