import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/core/model/category/index.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/bloc/operation_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/bloc/operation_form_view_model.dart';
import 'package:my_finance_flutter/ui/widgets/form/form_field_decorator.dart';

class OperationForm extends StatefulWidget {
  @override
  OperationFormState createState() => OperationFormState();
}

class OperationFormState extends State<OperationForm> {
  final FocusNode _valueNode = FocusNode();
  final FocusNode _descriptionNode = FocusNode();
  final FocusNode _accountNode = FocusNode();

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
        initialValue: operation.title,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Required";
          }

          return null;
        },
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
              initialValue: operation.getValue(),
              decoration: InputDecoration(
                hintText: "Value",
                labelText: "Value",
                prefixText: "R\$ ",
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
              ),
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(FocusNode());
                // _selectOperationType();
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
            child: FormField<OperationTypeModel>(
              initialValue: operation.type,
              validator: (value) {
                if (value == null) {
                  return "Required";
                }

                return null;
              },
              onSaved: (value) {
                bloc.updateOperation(
                  viewModel.operation.copyWith(type: value),
                );
              },
              builder: (fieldState) {
                return FormFieldDecorator(
                  text: Text((fieldState.value == null)
                      ? "Unknown"
                      : fieldState.value.title),
                  labelText: "Type",
                  prefixIcon: Icon(Icons.menu),
                  onTap: () => _selectOperationType(fieldState),
                );
              },
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
      FormField<CategoryModel>(
        initialValue: operation.category,
        validator: (value) {
          if (value == null) {
            return "Required";
          }

          return null;
        },
        onSaved: (value) {
          bloc.updateOperation(
            viewModel.operation.copyWith(category: value),
          );
        },
        builder: (fieldState) {
          return InkWell(
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: "Category",
                prefixIcon: Icon(Icons.category),
                border: OutlineInputBorder(),
                errorText: fieldState.errorText,
              ),
              child: Text(
                (fieldState.value == null) ? "Unknown" : fieldState.value.name,
              ),
              // text: Text(
              //   (fieldState.value == null) ? "Unknown" : fieldState.value.name,
              // ),
            ),
            onTap: _selectCategory,
          );
        },
      ),
      UIHelper.verticalSpaceSmall,
      CustomFormField<AccountModel>(
        labelText: "Account",
        focusNode: _accountNode,
        prefixIcon: Icon(Icons.account_balance),
        initialValue: operation.account,
        buildText: (value) => (value == null) ? "Unknown" : value.name,
        onSaved: (value) => bloc.updateOperation(
          viewModel.operation.copyWith(account: value),
        ),
        validator: (value) {
          if (value == null || value.name.isEmpty) {
            return "Required";
          }

          return null;
        },
        onFieldSubmitted: (value) => bloc.updateOperation(
          viewModel.operation.copyWith(account: value),
        ),
        onTap: () async {
          return await _selectAccount();
        },
      ),
      // FormFieldDecorator(
      //   text: Text(
      //     (operation?.account == null) ? "Unknown" : operation.account.name,
      //   ),
      //   labelText: "Account",
      //   prefixIcon: Icon(Icons.account_balance),
      //   onTap: _selectAccount,
      // ),
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

  void _selectOperationType(
    FormFieldState<OperationTypeModel> formState,
  ) async {
    bool result = await bloc.selectOperationType(formState);

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
      FocusScope.of(context).requestFocus(_accountNode);
    }
  }

  Future<AccountModel> _selectAccount() async {
    var result = await bloc.selectAccount();
    if (result != null) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
    return result;
  }
}

typedef CustomFormFieldTapCallback<T> = T Function();

class CustomFormField<T> extends StatefulWidget {
  final FocusNode focusNode;
  final void Function(T) onSaved;
  final void Function(T) onFieldSubmitted;
  final String Function(T) validator;
  final T initialValue;
  final String labelText;
  final Icon prefixIcon;
  final String Function(T) buildText;
  final CustomFormFieldTapCallback onTap;

  CustomFormField({
    Key key,
    this.focusNode,
    this.initialValue,
    this.onSaved,
    this.onFieldSubmitted,
    this.validator,
    this.labelText,
    this.prefixIcon,
    this.buildText,
    this.onTap,
  }) : super(key: key);

  @override
  _CustomFormFieldState<T> createState() => _CustomFormFieldState<T>();
}

class _CustomFormFieldState<T> extends State<CustomFormField<T>> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<T>(
        initialValue: widget.initialValue,
        validator: widget.validator,
        onSaved: widget.onSaved,
        builder: (fieldState) {
          return InkWell(
            focusNode: widget.focusNode,
            highlightColor: Colors.transparent,
            onFocusChange: (value) async {
              if (value == true) {
                var result = widget.onTap();
                if (result is Future<T>) {
                  result = await result;
                }
                if (result != null) {
                  fieldState.didChange(result);
                  if (widget.onFieldSubmitted != null) {
                    widget.onFieldSubmitted(result);
                  }
                } else {
                  FocusScope.of(context).requestFocus(FocusNode());
                }
              }
            },
            onTap: () async {
              var result = widget.onTap();
              if (result is Future<T>) {
                result = await result;
              }
              if (result != null) {
                fieldState.didChange(result);
                if (widget.onFieldSubmitted != null) {
                  widget.onFieldSubmitted(result);
                }
              } else {
                FocusScope.of(context).requestFocus(FocusNode());
              }
            },
            onHighlightChanged: (value) {
              setState(() {
                isFocused = value;
              });
            },
            child: InputDecorator(
              isFocused: isFocused,
              decoration: InputDecoration(
                labelText: widget.labelText,
                prefixIcon: widget.prefixIcon,
                border: OutlineInputBorder(),
                errorText: fieldState.errorText,
              ),
              child: Text(
                widget.buildText(fieldState.value),
              ),
            ),
          );
        },
      ),
    );
  }
}
