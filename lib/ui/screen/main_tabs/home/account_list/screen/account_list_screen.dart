import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_list/bloc/account_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_list/screen/account_list_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_list/widget/account_list_view.dart';

class AccountListScreen extends BaseScreen<AccountListBloc> {
  AccountListScreen(this.argument);

  final AccountListRouteArgs argument;

  @override
  Widget build(BuildContext context) {
    return AccountListView();
  }

  @override
  AccountListBloc buildBloc(BuildContext context) {
    return AccountListBloc();
  }
}
