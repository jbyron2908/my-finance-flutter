import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/text_input_validator/object_validator.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/bloc/account_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/bloc/account_form_view_model.dart';
import 'package:my_finance_flutter/ui/widgets/form/custom_form_field.dart';

class AccountForm extends StatefulWidget {
  @override
  AccountFormState createState() => AccountFormState();
}

class AccountFormState extends State<AccountForm> {
  final FocusNode _typeNode = FocusNode();
  final FocusNode _initialValueNode = FocusNode();
  final FocusNode _profileNode = FocusNode();

  AccountFormBloc bloc;
  AccountFormViewModel viewModel;
  AccountModel account;

  @override
  Widget build(BuildContext context) {
    bloc = AccountFormBloc.of(context);
    viewModel = AccountFormViewModel.of(context);
    account = viewModel.account;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        // Hide keyboard when scroll
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: bloc.formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            ...buildFormFields(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildFormFields() {
    return <Widget>[
      TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Name',
          labelText: 'Name',
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        initialValue: account.name,
        validator: RequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.update(name: value);
            _typeNode.requestFocus();
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
        focusNode: _typeNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'Type',
          labelText: 'Type',
          prefixIcon: Icon(Icons.category),
          border: OutlineInputBorder(),
        ),
        initialValue: account.type,
        validator: RequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.update(type: value);
            _initialValueNode.requestFocus();
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.update(type: value);
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      CustomFormField<ProfileModel>(
        labelText: 'Profile',
        focusNode: _profileNode,
        prefixIcon: Icon(Icons.account_circle),
        buildText: (value) => (value == null) ? 'Unknown' : value.name,
        initialValue: account.profile,
        validator: ObjectRequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.update(profile: value);
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.update(profile: value);
          }
        },
        onTapOrFocus: () => bloc.selectProfile(),
      ),
    ];
  }
}
