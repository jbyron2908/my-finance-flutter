import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';

class AccountItem extends StatelessWidget {
  AccountItem({
    this.account,
  });

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        account.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(account.profile.name),
      onTap: () => MainTabRouter.of(context).pop(account),
    );
  }
}
