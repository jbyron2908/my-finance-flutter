import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/model.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/operation/create/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/operation/create/screen/route.dart';
import 'package:my_finance_flutter/ui/view/operation/create/widget/view.dart';

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
