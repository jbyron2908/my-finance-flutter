import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/bloc/operation_state_selection_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/screen/operation_state_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/widget/operation_state_selection_view.dart';

class OperationStateSelectionScreen extends BaseScreen<
    OperationStateSelectionBloc, OperationStateSelectionRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return OperationStateSelectionView();
  }

  @override
  OperationStateSelectionBloc buildBloc(BuildContext context) {
    return OperationStateSelectionBloc();
  }
}
