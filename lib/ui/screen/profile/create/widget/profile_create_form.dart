import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/profile/create/bloc/profile_create_bloc.dart';

class ProfileCreateForm extends StatefulWidget {
  @override
  ProfileCreateFormState createState() => ProfileCreateFormState();
}

class ProfileCreateFormState extends State<ProfileCreateForm> {
  final ProfileModel profile = ProfileModel();
  final _formKey = GlobalKey<FormState>();

  final FocusNode _currencyNode = FocusNode();

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
    await ProfileCreateBloc.of(context).saveProfile(profile);
  }

  List<Widget> buildFormFields() {
    return <Widget>[
      TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Name",
          labelText: "Name",
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => _currencyNode.requestFocus(),
        onSaved: (value) => setState(() => profile.name = value),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _currencyNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Currency",
          labelText: "Currency",
          prefixIcon: Icon(Icons.monetization_on),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        onSaved: (value) => setState(() => profile.currency = value),
      )
    ];
  }
}
