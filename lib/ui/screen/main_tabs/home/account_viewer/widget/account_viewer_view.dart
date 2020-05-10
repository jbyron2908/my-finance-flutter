import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_list/operation_list_view.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_route.dart';

class AccountViewerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = AccountViewerRouteArgs.of(context).account;

    return Scaffold(
      appBar: AppBar(
        title: Text(account.name),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () => _showSnackBar(context, 'Month back'),
                ),
                Expanded(
                  child: Text(
                    'Current month',
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () => _showSnackBar(context, 'Month forward'),
                ),
              ],
            ),
            Divider(
              height: 0,
              thickness: 2,
              color: Colors.grey,
            ),
            OperationList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToOperationForm(context, account),
      ),
    );
  }

  void _navigateToOperationForm(BuildContext context, AccountModel account) {
    OperationFormRoute(
      argument: OperationFormRouteArgs.create(
        account: account,
      ),
    ).navigateIntoTab(context);
  }

  void _showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
