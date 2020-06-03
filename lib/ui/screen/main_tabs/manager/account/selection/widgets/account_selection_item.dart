import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/widget/account_item_view.dart';

class AccountSelectionItem extends StatelessWidget {
  AccountSelectionItem({
    this.account,
  });

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: AccountItemView(
        account: account,
        onTap: () => MainTabRouter.of(context).pop(account),
      ),
    );
  }
}
