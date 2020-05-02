import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/text_input_formatter/currency_formatter.dart';
import 'package:my_finance_flutter/ui/common/text_input_validator/currency_validator.dart';
import 'package:my_finance_flutter/ui/common/text_input_validator/object_validator.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/bloc/operation_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/bloc/operation_form_view_model.dart';
import 'package:my_finance_flutter/ui/widgets/form/custom_form_field.dart';

class OperationForm extends StatefulWidget {
  @override
  OperationFormState createState() => OperationFormState();
}

class OperationFormState extends State<OperationForm> {
  final FocusNode _valueNode = FocusNode();
  final FocusNode _typeNode = FocusNode();
  final FocusNode _dateNode = FocusNode();
  final FocusNode _timeNode = FocusNode();
  final FocusNode _payeeNode = FocusNode();
  final FocusNode _stateNode = FocusNode();
  final FocusNode _categoryNode = FocusNode();
  final FocusNode _accountNode = FocusNode();
  final FocusNode _noteNode = FocusNode();

  OperationFormBloc bloc;
  OperationFormViewModel viewModel;
  OperationModel operation;

  @override
  Widget build(BuildContext context) {
    bloc = OperationFormBloc.of(context);
    viewModel = OperationFormViewModel.of(context);
    operation = viewModel.operation;

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
          children: buildFormFields(),
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
        initialValue: operation.title,
        decoration: InputDecoration(
          hintText: "Title",
          labelText: "Title",
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        validator: RequiredValidator(errorText: "Required"),
        onFieldSubmitted: (value) {
          bloc.updateOperation(title: value);
          FocusScope.of(context).requestFocus(_valueNode);
        },
        onSaved: (value) {
          bloc.updateOperation(title: value);
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
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                CurrencyFormatter.build(),
              ],
              initialValue: operation.getValue(),
              decoration: InputDecoration(
                hintText: "Value",
                labelText: "Value",
                prefixText: "${operation.profile.currency} ",
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
              ),
              validator: MultiValidator([
                RequiredValidator(errorText: "Required"),
                CurrencyNotZeroValidator(errorText: "Required"),
              ]),
              onFieldSubmitted: (value) {
                if (value != null) {
                  bloc.updateOperation(value: double.parse(value));
                  FocusScope.of(context).requestFocus(_typeNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  bloc.updateOperation(value: double.parse(value));
                }
              },
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: CustomFormField<OperationTypeModel>(
              labelText: "Type",
              focusNode: _typeNode,
              prefixIcon: Icon(Icons.sort),
              initialValue: operation.type,
              buildText: (value) => value.title,
              validator: ObjectRequiredValidator(errorText: "Required"),
              onFieldSubmitted: (value) {
                if (value != null) {
                  bloc.updateOperation(type: value);
                  FocusScope.of(context).requestFocus(_dateNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  bloc.updateOperation(type: value);
                }
              },
              onTapOrFocus: () => bloc.selectOperationType(),
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceSmall,
      Row(
        children: <Widget>[
          Expanded(
            child: CustomFormField<DateTime>(
              labelText: "Date",
              focusNode: _dateNode,
              prefixIcon: Icon(Icons.access_time),
              initialValue: operation.date,
              buildText: (value) => _getDateString(value),
              validator: ObjectRequiredValidator(errorText: "Required"),
              onFieldSubmitted: (value) {
                if (value != null) {
                  bloc.updateOperation(date: value);
                  FocusScope.of(context).requestFocus(_timeNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  bloc.updateOperation(date: value);
                }
              },
              onTapOrFocus: () => bloc.selectDate(),
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: CustomFormField<DateTime>(
              labelText: "Time",
              focusNode: _timeNode,
              prefixIcon: Icon(Icons.access_time),
              initialValue: operation.date,
              buildText: (value) => _getTimeString(value),
              validator: ObjectRequiredValidator(errorText: "Required"),
              onFieldSubmitted: (value) {
                if (value != null) {
                  bloc.updateOperation(date: value);
                  FocusScope.of(context).requestFocus(_payeeNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  bloc.updateOperation(date: value);
                }
              },
              onTapOrFocus: () => bloc.selectTime(),
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceSmall,
      Row(
        children: <Widget>[
          Expanded(
            child: CustomFormField<PayeeModel>(
              labelText: "Payee",
              focusNode: _payeeNode,
              prefixIcon: Icon(Icons.person),
              initialValue: operation.payee,
              buildText: (value) => (value == null) ? "Unknown" : value.name,
              validator: ObjectRequiredValidator(errorText: "Required"),
              onFieldSubmitted: (value) {
                if (value != null) {
                  bloc.updateOperation(payee: value);
                  FocusScope.of(context).requestFocus(_stateNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  bloc.updateOperation(payee: value);
                }
              },
              onTapOrFocus: () => bloc.selectPayee(),
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: CustomFormField<OperationStateModel>(
              labelText: "State",
              focusNode: _stateNode,
              prefixIcon: Icon(Icons.check_circle),
              initialValue: operation.state,
              buildText: (value) => (value == null) ? "Unknown" : value.title,
              validator: ObjectRequiredValidator(errorText: "Required"),
              onFieldSubmitted: (value) {
                if (value != null) {
                  bloc.updateOperation(state: value);
                  FocusScope.of(context).requestFocus(_categoryNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  bloc.updateOperation(state: value);
                }
              },
              onTapOrFocus: () => bloc.selectOperationState(),
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceSmall,
      CustomFormField<CategoryModel>(
        labelText: "Category",
        focusNode: _categoryNode,
        prefixIcon: Icon(Icons.category),
        initialValue: operation.category,
        buildText: (value) => (value == null) ? "Unknown" : value.name,
        validator: ObjectRequiredValidator(errorText: "Required"),
        onFieldSubmitted: (value) {
          if (value != null) {
            bloc.updateOperation(category: value);
            FocusScope.of(context).requestFocus(_accountNode);
          }
        },
        onSaved: (value) {
          if (value != null) {
            bloc.updateOperation(category: value);
          }
        },
        onTapOrFocus: () => bloc.selectCategory(),
      ),
      UIHelper.verticalSpaceSmall,
      CustomFormField<AccountModel>(
        labelText: "Account",
        focusNode: _accountNode,
        prefixIcon: Icon(Icons.account_balance),
        initialValue: operation.account,
        buildText: (value) => (value == null) ? "Unknown" : value.name,
        validator: ObjectRequiredValidator(errorText: "Required"),
        onFieldSubmitted: (value) {
          if (value != null) {
            bloc.updateOperation(
              account: value,
              profile: value.profile,
            );
            FocusScope.of(context).requestFocus(_noteNode);
          }
        },
        onSaved: (value) {
          if (value != null) {
            bloc.updateOperation(
              account: value,
              profile: value.profile,
            );
          }
        },
        onTapOrFocus: () => bloc.selectAccount(),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _noteNode,
        keyboardType: TextInputType.text,
        maxLines: 3,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Note",
          labelText: "Note",
          alignLabelWithHint: true,
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) {
          if (value != null) {
            bloc.updateOperation(description: value);
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        onSaved: (value) {
          if (value != null) {
            bloc.updateOperation(description: value);
          }
        },
      ),
    ];
  }

  String _getDateString(DateTime date) {
    return date == null ? "Unknown" : DateFormat("dd/MM/yyyy").format(date);
  }

  String _getTimeString(DateTime date) {
    return date == null ? "Unknown" : DateFormat("HH:mm").format(date);
  }
}
