import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/widget/item/account_item.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var account = AccountItem.accountOf(context);

    return ListTile(
      title: Text(
        account.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(account.profile.name),
    );
  }
}
