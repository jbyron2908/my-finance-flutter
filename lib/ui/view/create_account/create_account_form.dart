import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';

class CreateAccountForm extends StatefulWidget {
  CreateAccountForm({Function(AccountEntity account) onSubmit})
      : onSubmit = onSubmit;

  final Function(AccountEntity account) onSubmit;

  @override
  CreateAccountFormState createState() =>
      CreateAccountFormState(onSubmit: onSubmit);
}

class CreateAccountFormState extends State<CreateAccountForm> {
  CreateAccountFormState({Function(AccountEntity account) onSubmit})
      : onSubmit = onSubmit;

  final Function(AccountEntity account) onSubmit;
  final AccountEntity account = AccountEntity();
  final _formKey = GlobalKey<FormState>();

  final FocusNode nameNode = FocusNode();
  final FocusNode typeNode = FocusNode();
  final FocusNode currencyNode = FocusNode();
  final FocusNode initialValueNode = FocusNode();

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
                ...buildFormFields(),
                UIHelper.verticalSpaceSmall,
                RaisedButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    submit();
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

  void submit() {
    FocusScope.of(context).requestFocus(FocusNode());
    _formKey.currentState.save();
    onSubmit(account);
  }

  List<Widget> buildFormFields() {
    return <Widget>[
      TextFormField(
        focusNode: nameNode,
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Name",
          labelText: "Name",
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) =>
            FocusScope.of(context).requestFocus(typeNode),
        onSaved: (value) => setState(() => account.name = value),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: typeNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Type",
          labelText: "Type",
          prefixIcon: Icon(Icons.category),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) =>
            FocusScope.of(context).requestFocus(currencyNode),
        onSaved: (value) => setState(() => account.type = value),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: currencyNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Currency",
          labelText: "Currency",
          prefixIcon: Icon(Icons.monetization_on),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) =>
            FocusScope.of(context).requestFocus(initialValueNode),
        onSaved: (value) => setState(() => account.currency = value),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: initialValueNode,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Initial value",
          labelText: "Initial value",
          prefixIcon: Icon(Icons.confirmation_number),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => submit(),
        onSaved: (value) =>
            setState(() => account.initialValue = double.parse(value)),
      ),
    ];
  }
}
