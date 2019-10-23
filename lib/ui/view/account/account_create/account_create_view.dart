import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/repository/account/account_repository.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/widgets/account_create_form.dart';

class AccountCreateView extends StatelessWidget {
  AccountCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var accountRepository = AccountRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: AccountCreateForm(onSubmit: (AccountModel account) async {
        await accountRepository.save(account);
        Navigator.of(context).pop();
      }),
    );
  }
}
