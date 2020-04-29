import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/model/payee/index.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';

class PayeeForm extends StatefulWidget {
  PayeeForm({Function(PayeeModel payee) onSubmit}) : onSubmit = onSubmit;

  final Function(PayeeModel payee) onSubmit;

  @override
  PayeeFormState createState() => PayeeFormState(onSubmit: onSubmit);
}

class PayeeFormState extends State<PayeeForm> {
  PayeeFormState({Function(PayeeModel payee) onSubmit}) : onSubmit = onSubmit;

  final Function(PayeeModel payee) onSubmit;
  PayeeModel payee = PayeeModel();
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
    onSubmit(payee);
  }

  List<Widget> buildFormFields() {
    return <Widget>[
      TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Name",
          labelText: "Name",
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        onSaved: (value) => setState(
          () => payee = payee.copyWith(name: value),
        ),
      ),
    ];
  }
}