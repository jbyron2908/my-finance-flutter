import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';

class OperationItem extends StatelessWidget {
  OperationItem({Key key, this.operation}) : super(key: key);

  final OperationModel operation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            operation.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
