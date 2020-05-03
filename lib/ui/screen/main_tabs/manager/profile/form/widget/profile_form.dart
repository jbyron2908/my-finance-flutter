import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/bloc/profile_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/bloc/profile_form_view_model.dart';

class ProfileForm extends StatefulWidget {
  @override
  ProfileFormState createState() => ProfileFormState();
}

class ProfileFormState extends State<ProfileForm> {
  final FocusNode _currencyNode = FocusNode();

  ProfileFormBloc bloc;
  ProfileFormViewModel viewModel;
  ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    bloc = ProfileFormBloc.of(context);
    viewModel = ProfileFormViewModel.of(context);
    profile = viewModel.profile;

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
        textInputAction: TextInputAction.next,
        initialValue: profile.name,
        decoration: InputDecoration(
          hintText: "Name",
          labelText: "Name",
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        validator: RequiredValidator(errorText: "Required"),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.update(name: value);
            _currencyNode.requestFocus();
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.update(name: value);
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _currencyNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        initialValue: profile.currency,
        decoration: InputDecoration(
          hintText: "Currency",
          labelText: "Currency",
          prefixIcon: Icon(Icons.monetization_on),
          border: OutlineInputBorder(),
        ),
        validator: RequiredValidator(errorText: "Required"),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.update(currency: value);
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.update(currency: value);
          }
        },
      )
    ];
  }
}
