import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/bloc/operation_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/widget/operation_list_view.dart';

class OperationListScreen extends BaseScreen<OperationListBloc> {
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
