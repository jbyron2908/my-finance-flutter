import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/account/account_list/screen/account_list_bloc.dart';
import 'package:my_finance_flutter/ui/view/account/account_list/widget/account_list_view.dart';

class AccountListScreen extends BaseScreen<AccountListBloc> {
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
