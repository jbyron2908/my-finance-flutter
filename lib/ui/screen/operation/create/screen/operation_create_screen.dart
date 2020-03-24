import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/model.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/operation/create/bloc/operation_create_bloc.dart';
import 'package:my_finance_flutter/ui/screen/operation/create/screen/operation_create_route.dart';
import 'package:my_finance_flutter/ui/screen/operation/create/widget/operation_create_view.dart';

class OperationCreateScreen extends BaseScreen<OperationCreateBloc> {
  OperationCreateScreen(this.screenArgs);

  final OperationCreateRouteArgs screenArgs;

  @override
  Widget build(BuildContext context) {
    return OperationCreateView();
  }

  @override
  OperationCreateBloc buildBloc(BuildContext context) {
    return OperationCreateBloc(
      context: context,
      operationRepository: OperationRepository.of(context),
      operation: OperationModel.empty(),
    );
  }
}
