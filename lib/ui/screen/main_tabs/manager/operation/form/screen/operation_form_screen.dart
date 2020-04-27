import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/bloc/operation_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_form_view.dart';
import 'package:provider/provider.dart';

class OperationFormScreen
    extends BaseScreen<OperationFormBloc, OperationFormScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return OperationFormView();
  }

  @override
  OperationFormBloc buildBloc(BuildContext context) {
    var argument = getArgument(context);

    OperationModel operation;

    switch (argument.type) {
      case OperationFormType.CREATE:
        operation = OperationModelExtra.buildEmpty();
        break;
      case OperationFormType.EDIT:
        operation = argument.operation;
        break;
      case OperationFormType.COPY:
        operation = argument.operation.buildCopy();
        break;
      default:
        operation = OperationModelExtra.buildEmpty();
    }

    return OperationFormBloc(
      context: context,
      operationRepository: OperationRepository.of(context),
      operation: operation,
    );
  }
}

class OperationFormScreenArgs {
  static OperationFormScreenArgs of(BuildContext context) =>
      Provider.of<OperationFormScreenArgs>(context, listen: false);

  OperationFormType type;
  OperationModel operation;

  OperationFormScreenArgs({
    @required this.type,
    this.operation,
  });
}

enum OperationFormType {
  CREATE,
  EDIT,
  COPY,
}
