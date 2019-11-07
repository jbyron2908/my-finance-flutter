import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/ui/view/account/widget/account_item.dart';
import 'package:provider/provider.dart';

class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<AccountModel>>(
      builder: (_, accountList, child) => ListView.builder(
        itemCount: accountList.length,
        itemBuilder: (context, index) => AccountItem(accountList[index]),
      ),
    );
  }
}
