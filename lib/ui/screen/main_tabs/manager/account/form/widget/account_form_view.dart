import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/widget/account_form.dart';

class AccountFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Account"),
      ),
      body: AccountForm(),
    );
  }
}
