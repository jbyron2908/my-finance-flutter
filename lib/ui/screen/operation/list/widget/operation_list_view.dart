import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/operation/create/screen/operation_create_route.dart';
import 'package:my_finance_flutter/ui/screen/operation/widget/operation_item.dart';
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
        onPressed: () => _navigateToOperationCreate(context),
      ),
    );
  }

  void _navigateToOperationCreate(BuildContext context) {
    AppRouter.navigateTo(context, OperationCreateRoute());
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
