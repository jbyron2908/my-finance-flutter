import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/model.dart';
import 'package:my_finance_flutter/ui/screen/account/widget/item.dart';
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