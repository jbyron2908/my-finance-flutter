import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';

class AccountItemView extends StatelessWidget {
  AccountItemView({
    this.account,
    this.onTap,
    this.onLongPress,
  });

  final AccountModel account;
  final Function() onTap;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        account.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(account.profile.name),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
