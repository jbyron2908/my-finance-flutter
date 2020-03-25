import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/create/bloc/account_create_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/create/widget/account_create_view.dart';
import 'package:provider/provider.dart';

class AccountCreateScreen
    extends BaseScreen<AccountCreateBloc, AccountCreateScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return AccountCreateView();
  }

  @override
  AccountCreateBloc buildBloc(BuildContext context) {
    return AccountCreateBloc(
      accountRepository: AccountRepository.of(context),
    );
  }
}

class AccountCreateScreenArgs {
  static AccountCreateScreenArgs of(BuildContext context) =>
      Provider.of<AccountCreateScreenArgs>(context, listen: false);

  int field1;

  AccountCreateScreenArgs({
    this.field1,
  });
}
