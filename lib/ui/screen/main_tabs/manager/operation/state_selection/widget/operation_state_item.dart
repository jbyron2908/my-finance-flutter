import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';

class OperationStateItem extends StatelessWidget {
  OperationStateItem({
    Key key,
    @required this.operationState,
  }) : super(key: key);

  final OperationStateModel operationState;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        operationState.title,
      ),
      onTap: () => MainTabRouter.of(context).pop(operationState),
    );
  }
}
