import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/model.dart';
import 'package:my_finance_flutter/core/model/category/model.dart';
import 'package:my_finance_flutter/core/model/operation/model.dart';
import 'package:my_finance_flutter/core/model/operation/state_model.dart';
import 'package:my_finance_flutter/core/model/operation/type_model.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/repository.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/account/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/category/selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/operation/state_selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/operation/type_selection/screen/route.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class OperationCreateBloc extends BaseBloc {
  static OperationCreateBloc of(BuildContext context) =>
      Provider.of<OperationCreateBloc>(context, listen: false);

  final BuildContext context;
  final OperationRepository operationRepository;
  final OperationModel operation;

  GlobalKey<FormState> formKey;

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

  Future<CategoryModel> selectCategory() async {
    return await AppRouter.navigateTo(context, CategorySelectionRoute());
  }

  Future<AccountModel> selectAccount() async {
    return await AppRouter.navigateTo(context, AccountSelectionRoute());
  }

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());
    formKey.currentState.save();
    await operationRepository.save(operation);
    Navigator.of(context).pop();
  }

  void cancel() async {
    Navigator.of(context).pop();
  }

  @override
  List<SingleChildWidget> get dependencies => [];
}
