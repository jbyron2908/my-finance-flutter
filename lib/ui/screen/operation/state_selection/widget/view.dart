import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/operation/state_selection/widget/item.dart';
import 'package:provider/provider.dart';

class OperationStateSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Type"),
      ),
      body: _OperationStateList(),
    );
  }
}

class _OperationStateList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<OperationStateModel>>(
      builder: (_, operationStateList, child) => ListView.builder(
        itemCount: operationStateList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => AppRouter.pop(context, operationStateList[index]),
          child: OperationStateItem(
            operationState: operationStateList[index],
          ),
        ),
      ),
    );
  }
}
