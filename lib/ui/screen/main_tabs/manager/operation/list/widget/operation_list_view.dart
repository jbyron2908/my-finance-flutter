import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/widget/operation_item.dart';
import 'package:provider/provider.dart';

class OperationListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Operations"),
      ),
      body: Container(
        child: _OperationList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null, // () => _navigateToOperationForm(context),
      ),
    );
  }

  /**
   * ! To navigate to operation form we need an account
   * ! Only possible now from the account_viewer
   */
  // void _navigateToOperationForm(BuildContext context) {
  //   MainTabRouter.of(context).navigateTo(
  //     OperationFormRoute(
  //       argument: OperationFormScreenArgs.create(),
  //     ),
  //   );
  // }
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
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.black,
              height: 10,
            ),
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
