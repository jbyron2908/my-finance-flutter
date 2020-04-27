import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/screen/account_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/widgets/account_selection.dart';

class AccountSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select accounts"),
      ),
      body: Container(
        child: AccountSelection(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToAccountForm(context),
      ),
    );
  }

  void _navigateToAccountForm(BuildContext context) {
    MainTabRouter.of(context).navigateTo(AccountFormRoute());
  }
}
