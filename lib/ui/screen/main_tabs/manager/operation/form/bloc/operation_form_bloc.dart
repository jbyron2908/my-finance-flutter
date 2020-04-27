import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/core/model/category/index.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/model/payee/index.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/core/util/date_util.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/bloc/operation_create_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/screen/operation_state_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/screen/operation_type_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/screen/payee_selection_route.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class OperationFormBloc extends BaseBloc {
  static OperationFormBloc of(BuildContext context) =>
      Provider.of<OperationFormBloc>(context, listen: false);

  OperationFormViewModel viewModel;

  final BuildContext context;
  final OperationRepository operationRepository;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  OperationFormBloc({
    @required this.context,
    @required this.operationRepository,
    @required OperationModel operation,
  }) {
    viewModel = OperationFormViewModel(operation);
    viewModel.operation = operation;
  }

  void updateOperation(OperationModel operationUpdate) async {
    viewModel.operation = operationUpdate;
  }

  Future<bool> selectOperationType() async {
    OperationTypeModel operationType = await MainTabRouter.of(context)
        .navigateTo(OperationTypeSelectionRoute());

    if (operationType != null) {
      viewModel.operation = viewModel.operation.copyWith(
        type: operationType,
      );
      return true;
    } else {
      return false;
    }
  }

  Future<bool> selectDate() async {
    var date = await showDatePicker(
      context: context,
      initialDate: viewModel.operation.date,
      firstDate: DateTime(1990),
      lastDate: DateTime(2050),
    );

    if (date != null) {
      var newDate = DateUtil.setDateTime(
        date,
        viewModel.operation.date.hour,
        viewModel.operation.date.minute,
      );

      viewModel.operation = viewModel.operation.copyWith(
        date: newDate,
      );
      return true;
    } else {
      return false;
    }
  }

  Future<bool> selectTime() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(viewModel.operation.date),
    );

    if (time != null) {
      var newDate = DateUtil.mergeDateAndTime(viewModel.operation.date, time);

      viewModel.operation = viewModel.operation.copyWith(
        date: newDate,
      );
      return true;
    } else {
      return false;
    }
  }

  Future<bool> selectOperationState() async {
    OperationStateModel operationState = await MainTabRouter.of(context)
        .navigateTo(OperationStateSelectionRoute());

    if (operationState != null) {
      viewModel.operation = viewModel.operation.copyWith(
        state: operationState,
      );
      return true;
    } else {
      return false;
    }
  }

  Future<bool> selectPayee() async {
    PayeeModel payeeSelected = await MainTabRouter.of(context).navigateTo(
      PayeeSelectionRoute(),
    );

    if (payeeSelected != null) {
      viewModel.operation = viewModel.operation.copyWith(
        payee: payeeSelected,
      );
      return true;
    } else {
      return false;
    }
  }

  Future<bool> selectCategory() async {
    CategoryModel categorySelected =
        await MainTabRouter.of(context).navigateTo(CategorySelectionRoute());

    if (categorySelected != null) {
      viewModel.operation = viewModel.operation.copyWith(
        category: categorySelected,
      );
      return true;
    } else {
      return false;
    }
  }

  Future<bool> selectAccount() async {
    AccountModel accountSelected =
        await MainTabRouter.of(context).navigateTo(AccountSelectionRoute());

    if (accountSelected != null) {
      viewModel.operation = viewModel.operation.copyWith(
        account: accountSelected,
        profile: accountSelected.profile,
      );
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await operationRepository.save(viewModel.operation);
      Navigator.of(context).pop();
    }
  }

  void cancel() async {
    Navigator.of(context).pop();
  }

  @override
  List<SingleChildWidget> get dependencies => [
        ChangeNotifierProvider.value(
          value: viewModel,
        )
      ];
}
