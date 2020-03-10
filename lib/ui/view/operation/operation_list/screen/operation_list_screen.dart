import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_list/screen/operation_list_bloc.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_list/widget/operation_list_view.dart';

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
