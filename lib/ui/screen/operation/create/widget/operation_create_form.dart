import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/core/model/category/index.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/model/payee/index.dart';
import 'package:my_finance_flutter/core/util/date_util.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/operation/create/bloc/operation_create_bloc.dart';
import 'package:my_finance_flutter/ui/widgets/form/form_field_decorator.dart';

class OperationCreateForm extends StatefulWidget {
  @override
  OperationCreateFormState createState() => OperationCreateFormState();
}

class OperationCreateFormState extends State<OperationCreateForm> {
  OperationModel get operation => bloc.operation;

  final FocusNode _valueNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();

  OperationCreateBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = OperationCreateBloc.of(context);

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
        onSaved: (value) => setState(
          () => operation.copyWith(title: value),
        ),
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
              onSaved: (value) => setState(
                () => operation.copyWith(value: double.parse(value)),
              ),
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
        onSaved: (value) => setState(
          () => operation.copyWith(description: value),
        ),
      ),
    ];
  }

  void _selectOperationType() async {
    OperationTypeModel operationType = await bloc.selectOperationType();
    if (operationType != null) {
      setState(() {
        operation.copyWith(type: operationType);
      });

      _selectDate();
    }
  }

  void _selectDate() async {
    var date = await showDatePicker(
      context: context,
      initialDate: operation.date,
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      setState(() {
        operation.copyWith(
          date: DateUtil.setDateTime(
            date,
            operation.date.hour,
            operation.date.minute,
          ),
        );
      });

      _selectTime();
    }
  }

  void _selectTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(operation.date),
    );
    if (time != null) {
      setState(() {
        operation.copyWith(
            date: DateUtil.mergeDateAndTime(operation.date, time));
      });

      _selectPayee();
    }
  }

  void _selectPayee() async {
    PayeeModel payeeSelected = await bloc.selectPayee();
    if (payeeSelected != null) {
      setState(() {
        operation.copyWith(payee: payeeSelected);
      });

      _selectOperationState();
    }
  }

  void _selectOperationState() async {
    OperationStateModel operationState = await bloc.selectOperationState();
    if (operationState != null) {
      setState(() {
        operation.copyWith(state: operationState);
      });

      _selectCategory();
    }
  }

  void _selectCategory() async {
    CategoryModel categorySelected = await bloc.selectCategory();
    if (categorySelected != null) {
      setState(() {
        operation.copyWith(category: categorySelected);
      });

      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  void _selectAccount() async {
    AccountModel accountSelected = await bloc.selectAccount();
    if (accountSelected != null) {
      setState(() {
        operation.copyWith(account: accountSelected);
      });

      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
