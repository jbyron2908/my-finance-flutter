import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/bloc/account_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/widget/account_form_view.dart';
import 'package:provider/provider.dart';

class AccountFormScreen
    extends BaseScreen<AccountFormBloc, AccountFormScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return AccountFormView();
  }

  @override
  AccountFormBloc buildBloc(BuildContext context) {
    var argument = getArgument(context);

    return AccountFormBloc(
      context,
      account: argument.account,
    );
  }
}

class AccountFormScreenArgs {
  static AccountFormScreenArgs of(BuildContext context) =>
      Provider.of<AccountFormScreenArgs>(context, listen: false);

  AccountModel account;

  AccountFormScreenArgs({
    this.account,
  });

  static AccountFormScreenArgs create() {
    var account = AccountModel();

    return AccountFormScreenArgs(
      account: account,
    );
  }

  static AccountFormScreenArgs edit({
    AccountModel account,
  }) {
    return AccountFormScreenArgs(
      account: account,
    );
  }
}
