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
        Get.focusScope.requestFocus(FocusNode());
      },
      child: Form(
        key: controller.formKey,
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
        initialValue: viewModel.operation.title,
        decoration: InputDecoration(
          hintText: 'Title',
          labelText: 'Title',
          prefixIcon: Icon(Icons.description),
          border: OutlineInputBorder(),
        ),
        validator: RequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          viewModel.update(title: value);
          Get.focusScope.requestFocus(_valueNode);
        },
        onSaved: (value) {
          viewModel.update(title: value);
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
              initialValue: viewModel.operation.getValue(),
              decoration: InputDecoration(
                hintText: 'Value',
                labelText: 'Value',
                prefixText: '${viewModel.operation.profile.currency} ',
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(),
              ),
              validator: MultiValidator([
                RequiredValidator(errorText: 'Required'),
                CurrencyNotZeroValidator(errorText: 'Required'),
              ]),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.update(value: double.parse(value));
                  Get.focusScope.requestFocus(_typeNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.update(value: double.parse(value));
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
              initialValue: viewModel.operation.type,
              buildText: (value) => value.title,
              validator: ObjectRequiredValidator(errorText: 'Required'),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.update(type: value);
                  Get.focusScope.requestFocus(_dateNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.update(type: value);
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
              initialValue: viewModel.operation.date,
              buildText: (value) => _getDateString(value),
              validator: ObjectRequiredValidator(errorText: 'Required'),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.update(date: value);
                  Get.focusScope.requestFocus(_timeNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.update(date: value);
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
              initialValue: viewModel.operation.date,
              buildText: (value) => _getTimeString(value),
              validator: ObjectRequiredValidator(errorText: 'Required'),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.update(date: value);
                  Get.focusScope.requestFocus(_payeeNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.update(date: value);
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
              initialValue: viewModel.operation.payee,
              buildText: (value) => (value == null) ? 'Unknown' : value.name,
              validator: ObjectRequiredValidator(errorText: 'Required'),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.update(payee: value);
                  Get.focusScope.requestFocus(_stateNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.update(payee: value);
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
              initialValue: viewModel.operation.state,
              buildText: (value) => (value == null) ? 'Unknown' : value.title,
              validator: ObjectRequiredValidator(errorText: 'Required'),
              onFieldSubmitted: (value) {
                if (value != null) {
                  viewModel.update(state: value);
                  Get.focusScope.requestFocus(_categoryNode);
                }
              },
              onSaved: (value) {
                if (value != null) {
                  viewModel.update(state: value);
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
        initialValue: viewModel.operation.category,
        buildText: (value) => (value == null) ? 'Unknown' : value.name,
        validator: ObjectRequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.update(category: value);
            Get.focusScope.requestFocus(_accountNode);
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.update(category: value);
          }
        },
        onTapOrFocus: () => controller.selectCategory(),
      ),
      UIHelper.verticalSpaceSmall,
      CustomFormField<AccountModel>(
        labelText: 'Account',
        focusNode: _accountNode,
        prefixIcon: Icon(Icons.account_balance),
        initialValue: viewModel.operation.account,
        buildText: (value) => (value == null) ? 'Unknown' : value.name,
        validator: ObjectRequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.update(
              account: value,
              profile: value.profile,
            );
            Get.focusScope.requestFocus(_noteNode);
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.update(
              account: value,
              profile: value.profile,
            );
          }
        },
        onTapOrFocus: () => controller.selectAccount(),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _noteNode,
        keyboardType: TextInputType.text,
        maxLines: 3,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Note',
          labelText: 'Note',
          alignLabelWithHint: true,
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.update(description: value);
            Get.focusScope.requestFocus(FocusNode());
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.update(description: value);
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
