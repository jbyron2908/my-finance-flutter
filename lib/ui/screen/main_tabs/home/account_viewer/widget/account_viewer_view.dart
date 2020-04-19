import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/create/screen/operation_create_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/widget/operation_item.dart';
import 'package:provider/provider.dart';

class AccountViewerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = AccountViewerScreenArgs.of(context).account;

    return Scaffold(
      appBar: AppBar(
        title: Text(account.name),
      ),
      body: Container(
        child: _OperationList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToOperationCreate(context),
      ),
    );
  }

  void _navigateToOperationCreate(BuildContext context) {
    MainTabRouter.of(context).navigateTo(OperationCreateRoute());
  }
}

class _OperationList extends StatelessWidget {
  _OperationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<OperationModel>>(
      builder: (_, operationList, child) {
        if (operationList == null) {
          return CircularProgressIndicator();
        } else {
          return ListView.builder(
            itemCount: operationList.length,
            itemBuilder: (context, index) => OperationItem(
              operation: operationList[index],
            ),
          );
        }
      },
    );
  }
}