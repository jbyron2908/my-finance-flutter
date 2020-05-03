import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/bloc/payee_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/bloc/payee_form_view_model.dart';

class PayeeForm extends StatefulWidget {
  @override
  PayeeFormState createState() => PayeeFormState();
}

class PayeeFormState extends State<PayeeForm> {
  PayeeFormBloc bloc;
  PayeeFormViewModel viewModel;
  PayeeModel payee;

  @override
  Widget build(BuildContext context) {
    bloc = PayeeFormBloc.of(context);
    viewModel = PayeeFormViewModel.of(context);
    payee = viewModel.payee;

    return Form(
      key: bloc.formKey,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          ...buildFormFields(),
        ],
      ),
    );
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
        initialValue: payee.name,
        validator: RequiredValidator(errorText: "Required"),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.update(name: value);
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.update(name: value);
          }
        },
      ),
    ];
  }
}
