import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';

class PayeeItem extends StatelessWidget {
  PayeeItem({Key key, this.payee}) : super(key: key);

  final PayeeModel payee;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            payee.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
