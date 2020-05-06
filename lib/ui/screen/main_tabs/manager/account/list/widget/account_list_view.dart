import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/widget/account_list_item.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/widget/account_list.dart';

class AccountListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      body: Container(
        child: AccountList(
          itemBuilder: (context, account) => AccountListItem(
            account: account,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToAccountForm(context),
      ),
    );
  }

  void _navigateToAccountForm(BuildContext context) {
    AccountFormRoute(
      argument: AccountFormScreenArgs.create(),
    ).navigateIntoTab(context);
  }
}
