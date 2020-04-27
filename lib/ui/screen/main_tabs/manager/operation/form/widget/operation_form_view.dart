import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_form.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_form_action_bar.dart';

class OperationFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Operation"),
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
