import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/widget/operation_type_item.dart';
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
          onTap: () => MainTabRouter.of(context).pop(operationTypeList[index]),
          child: OperationTypeItem(
            operationType: operationTypeList[index],
          ),
        ),
      ),
    );
  }
}
