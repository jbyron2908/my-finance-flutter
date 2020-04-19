import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/screen/account_viewer_screen.dart';

class AccountItem extends StatelessWidget {
  AccountItem({Key key, this.account}) : super(key: key);

  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _navigateToOperationList(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Text(account.name),
      ),
    );
  }

  _navigateToOperationList(BuildContext context) {
    MainTabRouter.of(context).navigateTo(
      AccountViewerRoute(
        argument: AccountViewerScreenArgs(account),
      ),
    );
  }
}
