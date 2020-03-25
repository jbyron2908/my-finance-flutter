import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/create/bloc/operation_create_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/create/widget/operation_create_view.dart';
import 'package:provider/provider.dart';

class OperationCreateScreen
    extends BaseScreen<OperationCreateBloc, OperationCreateScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return OperationCreateView();
  }

  @override
  OperationCreateBloc buildBloc(BuildContext context) {
    return OperationCreateBloc(
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
