import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/core/provider/model/operation_model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/view/category/category_selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/widgets/form/form_field_decorator.dart';

class OperationCreateForm extends StatefulWidget {
  OperationCreateForm({Function(OperationModel operation) onSubmit})
      : onSubmit = onSubmit;

  final Function(OperationModel operation) onSubmit;

  @override
  OperationCreateFormState createState() =>
      OperationCreateFormState(onSubmit: onSubmit);
}

class OperationCreateFormState extends State<OperationCreateForm> {
  OperationCreateFormState({Function(OperationModel operation) onSubmit})
      : onSubmit = onSubmit;

  final Function(OperationModel operation) onSubmit;
  final OperationModel operation = OperationModel();
  final _formKey = GlobalKey<FormState>();

  final FocusNode _valueNode = FocusNode();
  final FocusNode _typeNode = FocusNode();
  final FocusNode _dateNode = FocusNode();
  final FocusNode _stateNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
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
      ),
    );
  }

  void submit() {
    FocusScope.of(context).requestFocus(FocusNode());
    _formKey.currentState.save();
    onSubmit(operation);
  }

  List<Widget> buildFormFields() {
    return <Widget>[
      TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Title",
          labelText: "Title",
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => _valueNode.requestFocus(),
        onSaved: (value) => setState(
          () => operation.title = value,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _valueNode,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Value",
          labelText: "Value",
          prefixIcon: Icon(Icons.monetization_on),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => _typeNode.requestFocus(),
        onSaved: (value) => setState(
          () => operation.value = double.parse(value),
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
          prefixIcon: Icon(Icons.menu),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => _dateNode.requestFocus(),
        onSaved: (value) => setState(
          () => operation.type = value,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _dateNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Date",
          labelText: "Date",
          prefixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => _stateNode.requestFocus(),
        onSaved: (value) => setState(
          () => operation.date = value,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _stateNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "State",
          labelText: "State",
          prefixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => _descriptionNode.requestFocus(),
        onSaved: (value) => setState(
          () => operation.state = value,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _descriptionNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Description",
          labelText: "Description",
          prefixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        onSaved: (value) => setState(
          () => operation.description = value,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      FormFieldDecorator(
        text: Text(
          (operation?.category == null) ? "Unknown" : operation.category.name,
        ),
        labelText: "Category",
        prefixIcon: Icon(Icons.category),
        onTap: _selectCategory,
      ),
      UIHelper.verticalSpaceSmall,
      FormFieldDecorator(
        text: Text(
          (operation?.account == null) ? "Unknown" : operation.account.name,
        ),
        labelText: "Account",
        prefixIcon: Icon(Icons.category),
        onTap: _selectAccount,
      ),
    ];
  }

  void _selectCategory() async {
    CategoryModel categorySelected =
        await AppRouter.navigateTo(context, CategorySelectionRoute());
    setState(() {
      operation.category = categorySelected;
    });
  }

  void _selectAccount() async {
    AccountModel accountSelected =
        await AppRouter.navigateTo(context, AccountSelectionRoute());
    setState(() {
      operation.account = accountSelected;
    });
  }
}
