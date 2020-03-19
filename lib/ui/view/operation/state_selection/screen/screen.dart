import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/operation/state_selection/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/operation/state_selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/operation/state_selection/widget/view.dart';

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
