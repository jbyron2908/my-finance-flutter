import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/widgets/account_selection_item.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/widget/account_list.dart';

class AccountSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select accounts'),
      ),
      body: Container(
        child: AccountList(
          itemBuilder: (context, account) => AccountSelectionItem(
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
