import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/bloc/account_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/widget/account_list_view.dart';
import 'package:provider/provider.dart';

class AccountListScreen
    extends BaseScreen<AccountListBloc, AccountListScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return AccountListView();
  }

  @override
  AccountListBloc buildBloc(BuildContext context) {
    return AccountListBloc(
      accountRepository: AccountRepository.of(context),
    );
  }
}

class AccountListScreenArgs {
  static AccountListScreenArgs of(BuildContext context) =>
      Provider.of<AccountListScreenArgs>(context, listen: false);

  int field1;

  AccountListScreenArgs({
    this.field1,
  });
}
