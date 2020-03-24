import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';

class OperationStateItem extends StatelessWidget {
  OperationStateItem({
    Key key,
    @required this.operationState,
  }) : super(key: key);

  final OperationStateModel operationState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            operationState.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
