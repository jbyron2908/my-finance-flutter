import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/bloc/operation_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_form_view.dart';
import 'package:provider/provider.dart';

class OperationFormScreen
    extends BaseScreen<OperationFormBloc, OperationCreateScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return OperationFormView();
  }

  @override
  OperationFormBloc buildBloc(BuildContext context) {
    return OperationFormBloc(
      context: context,
      operationRepository: OperationRepository.of(context),
      operation: OperationModelExtra.buildEmpty(),
    );
  }
}

class OperationCreateScreenArgs {
  static OperationCreateScreenArgs of(BuildContext context) =>
      Provider.of<OperationCreateScreenArgs>(context, listen: false);

  int field1;

  OperationCreateScreenArgs({
    this.field1,
  });
}
