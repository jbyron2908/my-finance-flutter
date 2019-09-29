import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';

class CreateAccountForm extends StatefulWidget {
  @override
  CreateAccountFormState createState() => CreateAccountFormState();
}

class CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  var _focusNodeMap = HashMap<String, FocusNode>();
  var accountFormModel = AccountFormModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: this._formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                buildFormField(
                  id: "name",
                  label: "Name",
                  icon: Icon(Icons.title),
                  hint: "Name",
                  nextFocus: "type",
                ),
                SizedBox(
                  height: 8.0,
                ),
                buildFormField(
                  id: "type",
                  label: "Type",
                  icon: Icon(Icons.title),
                  keyboardType: TextInputType.number,
                  nextFocus: "initialValue",
                ),
                buildFormField(
                  id: "initialValue",
                  label: "Initial Value",
                  icon: Icon(Icons.money_off),
                  keyboardType: TextInputType.number,
                ),
                RaisedButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _formKey.currentState.save();
                    FocusScope.of(context).requestFocus(FocusNode());
                    Log.i(accountFormModel);
                  },
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFormField(
      {@required String id,
      @required String label,
      @required Icon icon,
      String hint = "",
      TextInputType keyboardType = TextInputType.text,
      String nextFocus}) {
    var focusNode = FocusNode();
    _focusNodeMap[id] = focusNode;

    return TextFormField(
      focusNode: focusNode,
      keyboardType: keyboardType,
      autofocus: true,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: icon,
        border: OutlineInputBorder(),
      ),
      onEditingComplete: () {
        Log.i("onEditingComplete");
        if (this._focusNodeMap.containsKey(nextFocus)) {
          focusNode.unfocus();
          FocusScope.of(context).requestFocus(this._focusNodeMap[nextFocus]);
        }
      },
      onFieldSubmitted: (value) => Log.i("onFieldSubmitted - value = $value"),
      // onFieldSubmitted: (value) {
      //   if (this._focusNodeMap.containsKey(nextFocus)) {
      //     this._focusNodeMap[nextFocus].requestFocus();
      //   }
      // },
      onSaved: (value) {
        accountFormModel.body = value;
      },
    );
  }
}

class AccountFormModel {
  String title;
  String body;

  String toString() => 'AccountFormModel(title: $title, body: $body)';
}
