import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/balance/widget/balance_list.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_screen.dart';

class BalanceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Balance'),
      ),
      body: Container(
        child: BalanceList(),
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
