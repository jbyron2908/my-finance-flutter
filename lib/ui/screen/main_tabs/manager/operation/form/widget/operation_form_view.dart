import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_create_action_bar.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_create_form.dart';

class OperationFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Operation"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: OperationForm(),
          ),
          OperationFormActionBar()
        ],
      ),
    );
  }
}
