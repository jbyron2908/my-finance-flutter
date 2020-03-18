import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_state_selection/screen/operation_state_selection_bloc.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_state_selection/screen/operation_state_selection_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_state_selection/widget/operation_state_selection_view.dart';

class OperationStateSelectionScreen
    extends BaseScreen<OperationStateSelectionBloc> {
  OperationStateSelectionScreen(this.screenArgs);

  final OperationStateSelectionRouteArgs screenArgs;

  @override
  Widget build(BuildContext context) {
    return OperationStateSelectionView();
  }

  @override
  OperationStateSelectionBloc buildBloc(BuildContext context) {
    return OperationStateSelectionBloc();
  }
}
