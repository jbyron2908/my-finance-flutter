import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
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
    return AccountFormBloc(
      accountRepository: AccountRepository.of(context),
    );
  }
}

class AccountFormScreenArgs {
  static AccountFormScreenArgs of(BuildContext context) =>
      Provider.of<AccountFormScreenArgs>(context, listen: false);

  int field1;

  AccountFormScreenArgs({
    this.field1,
  });
}
