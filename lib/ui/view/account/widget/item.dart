import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/model.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';

class AccountItem extends StatelessWidget {
  final AccountModel account;
  const AccountItem(this.account);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            account.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(account.type),
        ],
      ),
    );
  }
}
