import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/model/account/model.dart';
import 'package:my_finance_flutter/core/model/category/model.dart';
import 'package:my_finance_flutter/core/model/operation/model.dart';
import 'package:my_finance_flutter/core/model/operation/state_model.dart';
import 'package:my_finance_flutter/core/model/operation/type_model.dart';
import 'package:my_finance_flutter/core/util/date_util.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/view/operation/create/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/widgets/form/form_field_decorator.dart';

class OperationCreateForm extends StatefulWidget {
  @override
  OperationCreateFormState createState() => OperationCreateFormState();
}

class OperationCreateFormState extends State<OperationCreateForm> {
  OperationModel get operation => bloc.operation;

  final _formKey = GlobalKey<FormState>();

  final FocusNode _valueNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();

  OperationCreateBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = OperationCreateBloc.of(context);
    bloc.formKey = _formKey;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        // Hide keyboard when scroll
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Form(
          key: this._formKey,
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
        onSaved: (value) => setState(
          () => operation.value = double.parse(value),
        ),
      ),
      UIHelper.verticalSpaceSmall,
      FormFieldDecorator(
        text: Text(operation.getTypeString()),
        labelText: "Type",
        prefixIcon: Icon(Icons.menu),
        onTap: _selectOperationType,
      ),
      UIHelper.verticalSpaceSmall,
      Row(
        children: <Widget>[
          Expanded(
            flex: 2,
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
              text: Text(operation.getTimeString()),
              labelText: "Time",
              onTap: _selectTime,
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceSmall,
      FormFieldDecorator(
        text: Text(operation.getStateString()),
        labelText: "State",
        prefixIcon: Icon(Icons.menu),
        onTap: _selectOperationState,
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

  _selectDate() async {
    var date = await showDatePicker(
      context: context,
      initialDate: operation.date,
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
    );
    if (date != null) {
      setState(() {
        operation.date = DateUtil.setDateTime(
          date,
          operation.date.hour,
          operation.date.minute,
        );
      });
    }
  }

  _selectTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(operation.date),
    );
    if (time != null) {
      setState(() {
        operation.date = DateUtil.mergeDateAndTime(operation.date, time);
      });
    }
  }

  void _selectOperationType() async {
    OperationTypeModel operationType = await bloc.selectOperationType();
    setState(() {
      operation.type = operationType;
    });
  }

  void _selectOperationState() async {
    OperationStateModel operationState = await bloc.selectOperationState();
    setState(() {
      operation.state = operationState;
    });
  }

  void _selectCategory() async {
    CategoryModel categorySelected = await bloc.selectCategory();
    setState(() {
      operation.category = categorySelected;
    });
  }

  void _selectAccount() async {
    AccountModel accountSelected = await bloc.selectAccount();
    setState(() {
      operation.account = accountSelected;
    });
  }
}
