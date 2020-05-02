import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/bloc/account_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/selection/screen/profile_selection_route.dart';
import 'package:my_finance_flutter/ui/widgets/form/form_field_decorator.dart';

class AccountForm extends StatefulWidget {
  @override
  AccountFormState createState() => AccountFormState();
}

class AccountFormState extends State<AccountForm> {
  AccountModel account = AccountModel();
  final _formKey = GlobalKey<FormState>();

  final FocusNode _nameNode = FocusNode();
  final FocusNode _typeNode = FocusNode();
  final FocusNode _initialValueNode = FocusNode();

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

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());
    _formKey.currentState.save();
    await AccountFormBloc.of(context).saveAccount(account);
    MainTabRouter.of(context).pop();
  }

  List<Widget> buildFormFields() {
    return <Widget>[
      TextFormField(
        focusNode: _nameNode,
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Name",
          labelText: "Name",
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => _typeNode.requestFocus(),
        onSaved: (value) => setState(
          () => account = account.copyWith(name: value),
        ),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _typeNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Type",
          labelText: "Type",
          prefixIcon: Icon(Icons.category),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => _initialValueNode.requestFocus(),
        onSaved: (value) => setState(
          () => account = account.copyWith(type: value),
        ),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _initialValueNode,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Initial value",
          labelText: "Initial value",
          prefixIcon: Icon(Icons.confirmation_number),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        onSaved: (value) => setState(
          () => account = account.copyWith(initialValue: double.parse(value)),
        ),
      ),
      UIHelper.verticalSpaceSmall,
      FormFieldDecorator(
        text: Text(
          (account?.profile == null) ? "Unknown" : account.profile.name,
        ),
        labelText: "Profile",
        prefixIcon: Icon(Icons.person),
        onTap: _selectProfile,
      ),
    ];
  }

  void _selectProfile() async {
    ProfileModel profileSelected =
        await MainTabRouter.of(context).navigateTo(ProfileSelectionRoute());
    setState(() {
      account = account.copyWith(profile: profileSelected);
    });
  }
}
