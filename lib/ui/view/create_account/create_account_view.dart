import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/create_account/create_account_form.dart';

class CreateAccountView extends StatefulWidget {
  CreateAccountView({Key key}) : super(key: key);

  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: CreateAccountForm(),
    );
  }
}
