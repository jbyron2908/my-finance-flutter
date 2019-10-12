import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/operation_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/shared/operation/operation_item.dart';
import 'package:provider/provider.dart';

class OperationListView extends StatelessWidget {
  OperationListView({Key key}) : super(key: key);

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
    AppRouter.navigateToOperationCreate(context);
  }
}

class _OperationList extends StatelessWidget {
  _OperationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<OperationModel>>(
      builder: (_, operationList, child) => ListView.builder(
        itemCount: operationList.length,
        itemBuilder: (context, index) => OperationItem(
          operation: operationList[index],
        ),
      ),
    );
  }
}
