import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_list/operation_list_view.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_screen.dart';

class AccountViewerView extends StatelessWidget {
  final AccountViewerArg argument = Get.find();

  @override
  Widget build(BuildContext context) {
    var account = argument.account;

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
                  onPressed: () => _showSnackBar('Month back'),
                ),
                Expanded(
                  child: Text(
                    'Current month',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () => _showSnackBar('Month forward'),
                ),
              ],
            ),
            OperationList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToOperationForm(account),
      ),
    );
  }

  void _navigateToOperationForm(AccountModel account) {
    OperationFormScreen.navigateTo(OperationFormArg.create(account));
  }

  void _showSnackBar(String text) {
    Get.rawSnackbar(title: text);
  }
}
