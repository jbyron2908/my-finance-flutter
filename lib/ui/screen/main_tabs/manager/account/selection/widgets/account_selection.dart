import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/widget/account_item.dart';
import 'package:provider/provider.dart';

class AccountSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<AccountModel>>(
      builder: (_, accountList, child) => ListView.builder(
        itemCount: accountList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => AppRouter.pop(context, accountList[index]),
          child: AccountItem(accountList[index]),
        ),
      ),
    );
  }
}
