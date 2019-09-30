import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';

class CreateAccountForm extends StatefulWidget {
  CreateAccountForm({Function(Account account) onSubmit}) : onSubmit = onSubmit;

  final Function(Account account) onSubmit;

  @override
  CreateAccountFormState createState() =>
      CreateAccountFormState(onSubmit: onSubmit);
}

class CreateAccountFormState extends State<CreateAccountForm> {
  CreateAccountFormState({Function(Account account) onSubmit})
      : onSubmit = onSubmit;

  final Function(Account account) onSubmit;
  final Account account = Account();
  final _formKey = GlobalKey<FormState>();

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
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                    prefixIcon: Icon(Icons.title),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => setState(() => account.name = value),
                ),
                UIHelper.verticalSpaceSmall,
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Type",
                    labelText: "Type",
                    prefixIcon: Icon(Icons.category),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => setState(() => account.type = value),
                ),
                UIHelper.verticalSpaceSmall,
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: "Currency",
                    labelText: "Currency",
                    prefixIcon: Icon(Icons.monetization_on),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => setState(() => account.currency = value),
                ),
                UIHelper.verticalSpaceSmall,
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Initial value",
                    labelText: "Initial valuee",
                    prefixIcon: Icon(Icons.confirmation_number),
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (value) => setState(
                      () => account.initialValue = double.parse(value)),
                ),
                UIHelper.verticalSpaceSmall,
                RaisedButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _formKey.currentState.save();
                    onSubmit(account);
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
}
