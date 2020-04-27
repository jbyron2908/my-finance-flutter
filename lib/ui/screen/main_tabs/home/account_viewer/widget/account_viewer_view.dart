import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_item.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_screen.dart';
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
        onPressed: () => _navigateToOperationForm(context),
      ),
    );
  }

  void _navigateToOperationForm(BuildContext context) {
    MainTabRouter.of(context).navigateTo(
      OperationFormRoute(
        argument: OperationFormScreenArgs(
          type: OperationFormType.CREATE,
        ),
      ),
    );
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
          return Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text("Current month"),
                ],
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
                  itemCount: operationList.length,
                  itemBuilder: (context, index) => OperationItem(
                    operation: operationList[index],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
