import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_list/operation_list_view.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_screen.dart';

class AccountViewerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = AccountViewerScreenArgs.of(context).account;

    return Scaffold(
      appBar: AppBar(
        title: Text(account.name),
      ),
      body: Container(
        child: OperationList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToOperationForm(context, account),
      ),
    );
  }

  void _navigateToOperationForm(BuildContext context, AccountModel account) {
    MainTabRouter.of(context).navigateTo(
      OperationFormRoute(
        argument: OperationFormScreenArgs.create(
          account: account,
        ),
      ),
    );
  }
}
