import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';

class AccountListView extends StatelessWidget {
  AccountListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountRepository = AccountRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      body: Text("Accounts"),
    );
  }
}
