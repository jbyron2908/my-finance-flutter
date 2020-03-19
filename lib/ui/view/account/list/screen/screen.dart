import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/account/list/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/account/list/widget/view.dart';

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
