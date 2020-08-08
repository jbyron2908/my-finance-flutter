import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/controller/account_viewer_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_list/operation_list_view.dart';

class AccountViewerView extends StatelessWidget {
  final AccountViewerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var account = controller.argument.account;

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
    controller.navigateToOperationForm();
  }

  void _showSnackBar(String text) {
    Get.rawSnackbar(title: text);
  }
}
