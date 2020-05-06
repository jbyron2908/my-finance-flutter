import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_list.dart';
import 'package:provider/provider.dart';

class AccountList extends StatelessWidget {
  const AccountList({
    Key key,
    @required this.itemBuilder,
  }) : super(key: key);

  final Widget Function(BuildContext, AccountModel model) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Consumer<List<AccountModel>>(
      builder: (_, list, child) {
        list.sort(_sortAccount);
        return ItemList(
          modelList: list,
          itemBuilder: itemBuilder,
        );
      },
    );
  }

  int _sortAccount(AccountModel account1, AccountModel account2) {
    var profileResult = account1.profile.name.compareTo(account2.profile.name);
    if (profileResult == 0) {
      var nameResult = account1.name.compareTo(account2.name);
      return nameResult;
    }
    return profileResult;
  }
}
