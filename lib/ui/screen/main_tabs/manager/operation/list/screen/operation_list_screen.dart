import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/bloc/operation_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/widget/operation_list_view.dart';
import 'package:provider/provider.dart';

class OperationListScreen
    extends BaseScreen<OperationListBloc, OperationListScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return OperationListView();
  }

  @override
  OperationListBloc buildBloc(BuildContext context) {
    return OperationListBloc(
      operationRepository: OperationRepository.of(context),
    );
  }
}

class OperationListScreenArgs {
  static OperationListScreenArgs of(BuildContext context) =>
      Provider.of<OperationListScreenArgs>(context, listen: false);

  int field1;

  OperationListScreenArgs({
    this.field1,
  });
}
