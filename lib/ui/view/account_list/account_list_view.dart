import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:provider/provider.dart';

class AccountListView extends StatelessWidget {
  AccountListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
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
    var accountRepository = AccountRepository.of(context);
    return StreamProvider<List<AccountModel>>.value(
      value: accountRepository.accountListStream,
      initialData: List(),
      child: Consumer<List<AccountModel>>(
        builder: (_, accountList, child) => ListView.builder(
          itemCount: accountList.length,
          itemBuilder: (context, index) => AccountItem(accountList[index]),
        ),
      ),
    );
  }
}

class AccountItem extends StatelessWidget {
  final AccountModel account;
  const AccountItem(this.account);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            account.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(account.type),
        ],
      ),
    );
  }
}
