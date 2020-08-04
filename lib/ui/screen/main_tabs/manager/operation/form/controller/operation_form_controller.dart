import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/core/util/date_util.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/screen/account_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/controller/operation_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/screen/operation_state_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/screen/operation_type_selection_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/screen/payee_selection_screen.dart';

class OperationFormController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final OperationFormViewModel _viewModel = Get.find();
  final OperationRepository _operationRepository = Get.find();

  Future<OperationTypeModel> selectOperationType() {
    return OperationTypeSelectionScreen.navigateTo();
  }

  Future<DateTime> selectDate() async {
    var date = await showDatePicker(
      context: Get.context,
      initialDate: _viewModel.operation.date,
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
    );

    if (date != null) {
      return DateUtil.setDateTime(
        date,
        _viewModel.operation.date.hour,
        _viewModel.operation.date.minute,
      );
    } else {
      return null;
    }
  }

  Future<DateTime> selectTime() async {
    var time = await showTimePicker(
      context: Get.context,
      initialTime: TimeOfDay.fromDateTime(_viewModel.operation.date),
    );

    if (time != null) {
      return DateUtil.mergeDateAndTime(_viewModel.operation.date, time);
    } else {
      return null;
    }
  }

  Future<OperationStateModel> selectOperationState() async {
    return OperationStateSelectionScreen.navigateTo();
  }

  Future<PayeeModel> selectPayee() async {
    return PayeeSelectionScreen.navigateTo();
  }

  Future<CategoryModel> selectCategory() async {
    return CategorySelectionScreen.navigateTo(CategorySelectionArg(false));
  }

  Future<AccountModel> selectAccount() async {
    return AccountSelectionScreen.navigateTo();
  }

  void submit() async {
    Get.focusScope.requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _operationRepository.save(_viewModel.operation);
      MainTabRouter.pop();
    }
  }

  void cancel() async {
    MainTabRouter.pop();
  }
}
