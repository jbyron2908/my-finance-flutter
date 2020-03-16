import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_create/screen/operation_create_bloc.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_create/widget/operation_create_form.dart';

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
          RaisedButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              OperationCreateBloc.of(context).submit();
            },
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
