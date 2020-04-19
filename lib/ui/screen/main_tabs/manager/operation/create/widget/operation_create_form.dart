import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/create/bloc/operation_create_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/create/bloc/operation_create_view_model.dart';
import 'package:my_finance_flutter/ui/widgets/form/form_field_decorator.dart';

class OperationCreateForm extends StatefulWidget {
  @override
  OperationCreateFormState createState() => OperationCreateFormState();
}

class OperationCreateFormState extends State<OperationCreateForm> {
  final FocusNode _valueNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();

  OperationCreateBloc bloc;
  OperationCreateViewModel viewModel;
  OperationModel operation;

  @override
  Widget build(BuildContext context) {
    bloc = OperationCreateBloc.of(context);
    viewModel = OperationCreateViewModel.of(context);
    operation = viewModel.operation;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        // Hide keyboard when scroll
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Form(
          key: bloc.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ...buildFormFields(),
              ],
            ),
          ),
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
          hintText: "Title",
          labelText: "Title",
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => _valueNode.requestFocus(),
        onSaved: (value) {
          bloc.updateOperation(
            viewModel.operation.copyWith(title: value),
          );
        },
      ),
      UIHelper.verticalSpaceSmall,
      Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              focusNode: _valueNode,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Value",
                labelText: "Value",
                prefixText: "R\$ ",
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
              ),
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(FocusNode());
                _selectOperationType();
              },
              onSaved: (value) {
                bloc.updateOperation(
                  viewModel.operation.copyWith(value: double.parse(value)),
                );
              },
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: FormFieldDecorator(
              text: Text(operation.getTypeString()),
              labelText: "Type",
              prefixIcon: Icon(Icons.menu),
              onTap: _selectOperationType,
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceSmall,
      Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FormFieldDecorator(
              text: Text(operation.getDateString()),
              labelText: "Date",
              prefixIcon: Icon(Icons.calendar_today),
              onTap: _selectDate,
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            flex: 1,
            child: FormFieldDecorator(
              prefixIcon: Icon(Icons.access_time),
              text: Text(operation.getTimeString()),
              labelText: "Time",
              onTap: _selectTime,
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceSmall,
      Row(
        children: <Widget>[
          Expanded(
            child: FormFieldDecorator(
              text: Text(operation.getPayeeString()),
              labelText: "Payee",
              prefixIcon: Icon(Icons.check_circle),
              onTap: _selectPayee,
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: FormFieldDecorator(
              text: Text(operation.getStateString()),
              labelText: "State",
              prefixIcon: Icon(Icons.check_circle),
              onTap: _selectOperationState,
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceSmall,
      FormFieldDecorator(
        text: Text(operation.getCategoryString()),
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
        prefixIcon: Icon(Icons.account_balance),
        onTap: _selectAccount,
      ),
      UIHelper.verticalSpaceSmall,
      FormFieldDecorator(
        text: Text("Labels"),
        labelText: "Labels",
        prefixIcon: Icon(Icons.label),
        onTap: _selectCategory,
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _descriptionNode,
        keyboardType: TextInputType.text,
        maxLines: 3,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Note",
          labelText: "Note",
          alignLabelWithHint: true,
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        onSaved: (value) {
          bloc.updateOperation(
            viewModel.operation.copyWith(description: value),
          );
        },
      ),
    ];
  }

  void _selectOperationType() async {
    bool result = await bloc.selectOperationType();

    if (result) {
      _selectDate();
    }
  }

  void _selectDate() async {
    bool result = await bloc.selectDate();

    if (result) {
      _selectTime();
    }
  }

  void _selectTime() async {
    bool result = await bloc.selectTime();

    if (result) {
      _selectPayee();
    }
  }

  void _selectPayee() async {
    bool result = await bloc.selectPayee();
    if (result) {
      _selectOperationState();
    }
  }

  void _selectOperationState() async {
    bool result = await bloc.selectOperationState();
    if (result) {
      _selectCategory();
    }
  }

  void _selectCategory() async {
    bool result = await bloc.selectCategory();
    if (result) {
      _selectAccount();
    }
  }

  void _selectAccount() async {
    bool result = await bloc.selectAccount();
    if (result) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
