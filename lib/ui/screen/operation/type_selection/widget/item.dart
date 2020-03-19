import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/type_model.dart';

class OperationTypeItem extends StatelessWidget {
  OperationTypeItem({
    Key key,
    @required this.operationType,
  }) : super(key: key);

  final OperationTypeModel operationType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            operationType.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
