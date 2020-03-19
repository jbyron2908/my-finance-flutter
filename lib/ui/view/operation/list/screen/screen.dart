import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/operation/list/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/operation/list/widget/view.dart';

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
