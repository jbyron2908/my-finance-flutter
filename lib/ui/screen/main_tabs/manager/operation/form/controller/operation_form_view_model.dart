import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_screen.dart';

class OperationFormViewModel extends ChangeNotifier {
  final RxString title = ''.obs;
  final RxDouble value = 0.0.obs;
  final Rx<OperationTypeModel> type = Rx();
  final Rx<DateTime> date = Rx();
  final Rx<OperationStateModel> state = Rx();
  final RxString description = ''.obs;
  final Rx<PayeeModel> payee = Rx();
  final Rx<CategoryModel> category = Rx();
  final Rx<AccountModel> account = Rx();
  final Rx<ProfileModel> profile = Rx();

  OperationFormArg argument;

  void setArgument(OperationFormArg argument) {
    this.argument = argument;
    var operation = argument.operation;

    title.value = operation.title ?? title.value;
    value.value = operation.value ?? value.value;
    type.value = operation.type ?? type.value;
    date.value = operation.date ?? date.value;
    state.value = operation.state ?? state.value;
    description.value = operation.description ?? description.value;
    payee.value = operation.payee ?? payee.value;
    category.value = operation.category ?? category.value;
    account.value = operation.account ?? account.value;
    profile.value = operation.account.profile ?? operation.profile;
  }

  OperationModel buildForm() {
    var operation = argument.operation;

    return operation.copyWith(
      title: title.value,
      value: value.value,
      type: type.value,
      date: date.value,
      state: state.value,
      description: description.value,
      payee: payee.value,
      category: category.value,
      account: account.value,
      profile: profile.value,
    );
  }

  String getValue() {
    final formarter = NumberFormat('00.00');
    return formarter.format(value.value);
  }

  String getCurrency() {
    return '${profile.value.currency} ';
  }
}
