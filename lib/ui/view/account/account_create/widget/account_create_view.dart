import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/widget/account_create_form.dart';

class AccountCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: AccountCreateForm(),
    );
  }
}
