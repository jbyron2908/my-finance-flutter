import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/shared/account/account_item.dart';
import 'package:provider/provider.dart';

class AccountSelectionView extends StatelessWidget {
  AccountSelectionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select accounts"),
      ),
      body: Container(
        child: AccountList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToAccountCreate(context),
      ),
    );
  }

  void _navigateToAccountCreate(BuildContext context) {
    AppRouter.navigateToAccountCreate(context);
  }
}

class AccountList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<AccountModel>>(
      builder: (_, accountList, child) => ListView.builder(
        itemCount: accountList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.pop(context, accountList[index]),
          child: AccountItem(accountList[index]),
        ),
      ),
    );
  }
}
