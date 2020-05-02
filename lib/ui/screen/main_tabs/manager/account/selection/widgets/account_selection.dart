import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/widget/account_item.dart';
import 'package:provider/provider.dart';

class AccountSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<AccountModel>>(
      builder: (_, accountList, child) => ListView.builder(
        itemCount: accountList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => MainTabRouter.of(context).pop(accountList[index]),
          child: AccountItem(accountList[index]),
        ),
      ),
    );
  }
}
