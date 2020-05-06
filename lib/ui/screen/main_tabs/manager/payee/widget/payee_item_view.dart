import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';

class PayeeItemView extends StatelessWidget {
  const PayeeItemView({
    Key key,
    @required this.payee,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final PayeeModel payee;
  final Function() onTap;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        payee.name,
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
