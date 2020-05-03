import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/widget/item/account_actions.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/widget/item/account_view.dart';
import 'package:provider/provider.dart';

class AccountItem extends StatelessWidget {
  static AccountModel accountOf(BuildContext context) =>
      Provider.of<AccountModel>(context, listen: false);

  AccountItem({
    Key key,
    this.account,
  }) : super(key: key);

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: account,
      child: AccountActions(
        child: AccountView(),
      ),
    );
  }
}
