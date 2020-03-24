import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/account/list/bloc/account_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/account/list/widget/account_list_view.dart';

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
