import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/operation/create/widget/action_bar.dart';
import 'package:my_finance_flutter/ui/view/operation/create/widget/form.dart';

class OperationCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Operation"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: OperationCreateForm(),
          ),
          OperationCreateActionBar()
        ],
      ),
    );
  }
}
