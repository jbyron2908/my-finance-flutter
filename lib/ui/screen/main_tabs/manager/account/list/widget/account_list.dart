import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/widget/item/account_item.dart';
import 'package:provider/provider.dart';

class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<AccountModel>>(
      builder: (_, accountList, child) {
        accountList.sort(
          (account1, account2) {
            int nameResult = account1.name.compareTo(account2.name);
            if (nameResult == 0) {
              return account1.profile.name.compareTo(account2.profile.name);
            }
            return nameResult;
          },
        );
        return ListView.separated(
          itemCount: accountList.length,
          itemBuilder: (context, index) => AccountItem(
            account: accountList[index],
          ),
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
