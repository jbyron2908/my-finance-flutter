import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/model/profile_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/view/account/account_create/screen/account_create_bloc.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_selection/screen/profile_selection_route.dart';

class AccountCreateForm extends StatefulWidget {
  @override
  AccountCreateFormState createState() => AccountCreateFormState();
}

class AccountCreateFormState extends State<AccountCreateForm> {
  final AccountModel account = AccountModel();
  final _formKey = GlobalKey<FormState>();

  final FocusNode _nameNode = FocusNode();
  final FocusNode _typeNode = FocusNode();
  final FocusNode _initialValueNode = FocusNode();

  FocusNode _profileNode = FocusNode();
  TextEditingController _profileController = TextEditingController();

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
    await AccountCreateBloc.of(context).saveAccount(account);
    AppRouter.pop(context);
  }

  List<Widget> buildFormFields() {
    _profileController.text =
        (account?.profile == null) ? "Unknown" : account.profile.name;

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
        onSaved: (value) => setState(() => account.name = value),
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
        onSaved: (value) => setState(() => account.type = value),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _initialValueNode,
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
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _profileNode,
        controller: _profileController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onTap: _selectProfile,
        decoration: InputDecoration(
          hintText: "Profile",
          labelText: "Profile",
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(),
        ),
      ),
    ];
  }

  void _selectProfile() async {
    ProfileModel profileSelected =
        await AppRouter.navigateTo(context, ProfileSelectionRoute());
    setState(() {
      account.profile = profileSelected;
    });
  }
}
