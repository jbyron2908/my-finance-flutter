import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/model/label/index.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';

class LabelCreateForm extends StatefulWidget {
  LabelCreateForm({Function(LabelModel label) onSubmit}) : onSubmit = onSubmit;

  final Function(LabelModel label) onSubmit;

  @override
  LabelCreateFormState createState() =>
      LabelCreateFormState(onSubmit: onSubmit);
}

class LabelCreateFormState extends State<LabelCreateForm> {
  LabelCreateFormState({Function(LabelModel label) onSubmit})
      : onSubmit = onSubmit;

  final Function(LabelModel label) onSubmit;
  LabelModel label = LabelModel();
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
    onSubmit(label);
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
          () => label = label.copyWith(name: value),
        ),
      ),
    ];
  }
}
