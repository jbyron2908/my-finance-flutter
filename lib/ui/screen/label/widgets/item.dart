import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/model.dart';

class LabelItem extends StatelessWidget {
  LabelItem({Key key, this.label}) : super(key: key);

  final LabelModel label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
