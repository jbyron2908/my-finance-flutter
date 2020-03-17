import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/core/provider/model/operation_model.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:my_finance_flutter/ui/view/account/account_selection/screen/account_selection_route.dart';
import 'package:my_finance_flutter/ui/view/category/category_selection/screen/category_selection_route.dart';
import 'package:provider/src/provider.dart';

class OperationCreateBloc extends BaseBloc {
  static OperationCreateBloc of(BuildContext context) =>
      Provider.of<OperationCreateBloc>(context);

  final BuildContext context;
  final OperationRepository operationRepository;
  final OperationModel operation;

  GlobalKey<FormState> formKey;

  OperationCreateBloc({
    @required this.context,
    @required this.operationRepository,
    @required this.operation,
  });

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
  List<SingleChildCloneableWidget> get dependencies => [];
}
