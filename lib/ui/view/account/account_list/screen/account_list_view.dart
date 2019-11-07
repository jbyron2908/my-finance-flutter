import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/screen/account_create_route.dart';
import 'package:my_finance_flutter/ui/view/account/account_list/screen/account_list_bloc.dart';
import 'package:my_finance_flutter/ui/view/account/account_list/widget/account_list.dart';

class AccountListView extends BaseScreen<AccountListBloc> {
  AccountListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      body: Container(
        child: AccountList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToAccountCreate(context),
      ),
    );
  }

  void _navigateToAccountCreate(BuildContext context) {
    AppRouter.navigateTo(context, AccountCreateRoute());
  }

  @override
  AccountListBloc buildBloc(BuildContext context) {
    return AccountListBloc(
      accountRepository: AccountRepository.of(context),
    );
  }
}
