import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_type_selection/widget/operation_type_item.dart';
import 'package:provider/provider.dart';

class OperationTypeSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Type"),
      ),
      body: _OperationTypeList(),
    );
  }
}

class _OperationTypeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<OperationTypeModel>>(
      builder: (_, operationTypeList, child) => ListView.builder(
        itemCount: operationTypeList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => AppRouter.pop(context, operationTypeList[index]),
          child: OperationTypeItem(
            operationType: operationTypeList[index],
          ),
        ),
      ),
    );
  }
}
