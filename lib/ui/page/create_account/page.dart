import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/page/create_account/form.dart';

class CreateAccountPage extends StatefulWidget {
  CreateAccountPage({Key key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
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
