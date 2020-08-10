import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/text_input_formatter/currency_formatter.dart';
import 'package:my_finance_flutter/ui/common/text_input_validator/currency_validator.dart';
import 'package:my_finance_flutter/ui/common/text_input_validator/object_validator.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/controller/operation_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/controller/operation_form_view_model.dart';
import 'package:my_finance_flutter/ui/widgets/form/custom_form_field.dart';

class OperationForm extends StatelessWidget {
  final FocusNode _valueNode = FocusNode();
  final FocusNode _typeNode = FocusNode();
  final FocusNode _dateNode = FocusNode();
  final FocusNode _timeNode = FocusNode();
  final FocusNode _payeeNode = FocusNode();
  final FocusNode _stateNode = FocusNode();
  final FocusNode _categoryNode = FocusNode();
  final FocusNode _accountNode = FocusNode();
  final FocusNode _noteNode = FocusNode();

  final OperationFormController controller = Get.find();
  final OperationFormViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        // Hide keyboard when scroll
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: buildFormFields(context),
        ),
      ),
    );
  }

  List<Widget> buildFormFields(BuildContext context) {
    return <Widget>[
      TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        initialValue: viewModel.title.value,
        decoration: InputDecoration(
          hintText: 'Title',
          labelText: 'Title',
          prefixIcon: Icon(Icons.description),
          border: OutlineInputBorder(),
        ),
        validator: RequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          viewModel.title.value = value;
          _valueNode.requestFocus();
        },
        onSaved: (value) {
          viewModel.title.value = value;
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
              initialValue: viewModel.getValue(),
              decoration: InputDecoration(
                hintText: 'Value',
                labelText: 'Value',
                prefixText: viewModel.getCurrency(),
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
              ),
              validator: MultiValidator([
                RequiredValidator(errorText: 'Required'),
                CurrencyNotZeroValidator(errorText: 'Required'),
              ]),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.value.value = double.parse(value);
                  _typeNode.requestFocus();
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.value.value = double.parse(value);
                }
              },
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: CustomFormField<OperationTypeModel>(
              labelText: 'Type',
              focusNode: _typeNode,
              prefixIcon: Icon(Icons.sort),
              initialValue: viewModel.type.value,
              buildText: (value) => value.title,
              validator: ObjectRequiredValidator(errorText: 'Required'),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.type.value = value;
                  _dateNode.requestFocus();
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.type.value = value;
                }
              },
              onTapOrFocus: () => controller.selectOperationType(),
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceSmall,
      Row(
        children: <Widget>[
          Expanded(
            child: CustomFormField<DateTime>(
              labelText: 'Date',
              focusNode: _dateNode,
              prefixIcon: Icon(Icons.access_time),
              initialValue: viewModel.date.value,
              buildText: (value) => _getDateString(value),
              validator: ObjectRequiredValidator(errorText: 'Required'),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.date.value = value;
                  _timeNode.requestFocus();
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.date.value = value;
                }
              },
              onTapOrFocus: () => controller.selectDate(),
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: CustomFormField<DateTime>(
              labelText: 'Time',
              focusNode: _timeNode,
              prefixIcon: Icon(Icons.access_time),
              initialValue: viewModel.date.value,
              buildText: (value) => _getTimeString(value),
              validator: ObjectRequiredValidator(errorText: 'Required'),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.date.value = value;
                  _payeeNode.requestFocus();
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.date.value = value;
                }
              },
              onTapOrFocus: () => controller.selectTime(),
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceSmall,
      Row(
        children: <Widget>[
          Expanded(
            child: CustomFormField<PayeeModel>(
              labelText: 'Payee',
              focusNode: _payeeNode,
              prefixIcon: Icon(Icons.person),
              initialValue: viewModel.payee.value,
              buildText: (value) => (value == null) ? 'Unknown' : value.name,
              validator: ObjectRequiredValidator(errorText: 'Required'),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.payee.value = value;
                  _stateNode.requestFocus();
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.payee.value = value;
                }
              },
              onTapOrFocus: () => controller.selectPayee(),
            ),
          ),
          UIHelper.horizontalSpaceSmall,
          Expanded(
            child: CustomFormField<OperationStateModel>(
              labelText: 'State',
              focusNode: _stateNode,
              prefixIcon: Icon(Icons.check_circle),
              initialValue: viewModel.state.value,
              buildText: (value) => (value == null) ? 'Unknown' : value.title,
              validator: ObjectRequiredValidator(errorText: 'Required'),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.state.value = value;
                  _categoryNode.requestFocus();
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.state.value = value;
                }
              },
              onTapOrFocus: () => controller.selectOperationState(),
            ),
          ),
        ],
      ),
      UIHelper.verticalSpaceSmall,
      CustomFormField<CategoryModel>(
        labelText: 'Category',
        focusNode: _categoryNode,
        prefixIcon: Icon(Icons.category),
        initialValue: viewModel.category.value,
        buildText: (value) => (value == null) ? 'Unknown' : value.name,
        validator: ObjectRequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.category.value = value;
            _accountNode.requestFocus();
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.category.value = value;
          }
        },
        onTapOrFocus: () => controller.selectCategory(),
      ),
      UIHelper.verticalSpaceSmall,
      CustomFormField<AccountModel>(
        labelText: 'Account',
        focusNode: _accountNode,
        prefixIcon: Icon(Icons.account_balance),
        initialValue: viewModel.account.value,
        buildText: (value) => (value == null) ? 'Unknown' : value.name,
        validator: ObjectRequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.account.value = value;
            viewModel.profile.value = value.profile;
            _noteNode.requestFocus();
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.account.value = value;
            viewModel.profile.value = value.profile;
          }
        },
        onTapOrFocus: () => controller.selectAccount(),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _noteNode,
        keyboardType: TextInputType.text,
        maxLines: 3,
        initialValue: viewModel.description.value,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Note',
          labelText: 'Note',
          alignLabelWithHint: true,
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.description.value = value;
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.description.value = value;
          }
        },
      ),
    ];
  }

  String _getDateString(DateTime date) {
    return date == null ? 'Unknown' : DateFormat('dd/MM/yyyy').format(date);
  }

  String _getTimeString(DateTime date) {
    return date == null ? 'Unknown' : DateFormat('HH:mm').format(date);
  }
}
