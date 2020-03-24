import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/account/selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/category/selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/operation/state_selection/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/operation/type_selection/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/payee/selection/screen/route.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class OperationCreateBloc extends BaseBloc {
  static OperationCreateBloc of(BuildContext context) =>
      Provider.of<OperationCreateBloc>(context, listen: false);

  final BuildContext context;
  final OperationRepository operationRepository;
  final OperationModel operation;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  OperationCreateBloc({
    @required this.context,
    @required this.operationRepository,
    @required this.operation,
  });

  Future<OperationTypeModel> selectOperationType() async {
    return await AppRouter.navigateTo(context, OperationTypeSelectionRoute());
  }

  Future<OperationStateModel> selectOperationState() async {
    return await AppRouter.navigateTo(context, OperationStateSelectionRoute());
  }

  Future<PayeeModel> selectPayee() async {
    return await AppRouter.navigateTo(context, PayeeSelectionRoute());
  }

  Future<CategoryModel> selectCategory() async {
    return await AppRouter.navigateTo(context, CategorySelectionRoute());
  }

  Future<AccountModel> selectAccount() async {
    return await AppRouter.navigateTo(context, AccountSelectionRoute());
  }

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await operationRepository.save(operation);
      Navigator.of(context).pop();
    }
  }

  void cancel() async {
    Navigator.of(context).pop();
  }

  @override
  List<SingleChildWidget> get dependencies => [];
}
