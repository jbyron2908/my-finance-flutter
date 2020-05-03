import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/core/util/date_util.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/bloc/operation_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/screen/operation_state_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/screen/operation_type_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/screen/payee_selection_route.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class OperationFormBloc extends BaseBloc {
  static OperationFormBloc of(BuildContext context) =>
      Provider.of<OperationFormBloc>(context, listen: false);

  final BuildContext context;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  OperationFormViewModel _viewModel;
  OperationRepository _operationRepository;

  OperationFormBloc({
    @required this.context,
    @required OperationModel operation,
  }) {
    _operationRepository = OperationRepository.of(context);
    _viewModel = OperationFormViewModel(operation);
  }

  Future<OperationTypeModel> selectOperationType() {
    return OperationTypeSelectionRoute().navigateIntoTab(context);
  }

  Future<DateTime> selectDate() async {
    var date = await showDatePicker(
      context: context,
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
      context: context,
      initialTime: TimeOfDay.fromDateTime(_viewModel.operation.date),
    );

    if (time != null) {
      return DateUtil.mergeDateAndTime(_viewModel.operation.date, time);
    } else {
      return null;
    }
  }

  Future<OperationStateModel> selectOperationState() async {
    return OperationStateSelectionRoute().navigateIntoTab(context);
  }

  Future<PayeeModel> selectPayee() async {
    return PayeeSelectionRoute().navigateIntoTab(context);
  }

  Future<CategoryModel> selectCategory() async {
    return CategorySelectionRoute().navigateIntoTab(context);
  }

  Future<AccountModel> selectAccount() async {
    return AccountSelectionRoute().navigateIntoTab(context);
  }

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _operationRepository.save(_viewModel.operation);
      MainTabRouter.of(context).pop();
    }
  }

  void cancel() async {
    MainTabRouter.of(context).pop();
  }

  @override
  List<SingleChildWidget> get dependencies => [
        ChangeNotifierProvider.value(
          value: _viewModel,
        )
      ];
}
