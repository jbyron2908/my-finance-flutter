import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/provider/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/screen/account_selection_route.dart';
import 'package:path/path.dart' as path;

class ImportCsvForm extends StatefulWidget {
  ImportCsvForm({this.onSubmit});

  final Function(AccountModel account, File csvFile) onSubmit;

  @override
  ImportCsvFormState createState() => ImportCsvFormState(onSubmit: onSubmit);
}

class ImportCsvFormState extends State<ImportCsvForm> {
  ImportCsvFormState({this.onSubmit});

  final Function(AccountModel category, File csvFile) onSubmit;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fileController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();

  AccountModel _account = AccountModel();
  File _file;

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
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildFormFields() {
    _fileController.text =
        _file == null ? "Unknown" : path.basename(_file.path);
    _accountController.text = _account == null ? "Unknown" : _account.name;

    return <Widget>[
      TextFormField(
        controller: _fileController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "File",
          labelText: "File",
          prefixIcon: Icon(Icons.category),
          border: OutlineInputBorder(),
        ),
        onTap: _selectFile,
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        controller: _accountController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Account",
          labelText: "Account",
          prefixIcon: Icon(Icons.category),
          border: OutlineInputBorder(),
        ),
        onTap: _selectAccount,
      ),
    ];
  }

  void _selectFile() async {
    final fileSelected = await FilePicker.getFile(fileExtension: "csv");
    setState(() {
      _file = fileSelected;
    });
  }

  void _selectAccount() async {
    AccountModel accountSelected =
        await AppRouter.navigateTo(context, AccountSelectionRoute());
    setState(() {
      _account = accountSelected;
    });
  }

  void submit() {
    FocusScope.of(context).requestFocus(FocusNode());
    _formKey.currentState.save();
    onSubmit(_account, _file);
  }
}
