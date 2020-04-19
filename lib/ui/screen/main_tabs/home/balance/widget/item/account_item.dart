import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';

class AccountItem extends StatelessWidget {
  AccountItem({Key key, this.account}) : super(key: key);

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(account.name),
    );
  }
}
