import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_type_selection/screen/operation_type_selection_bloc.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_type_selection/screen/operation_type_selection_route.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_type_selection/widget/operation_type_selection_view.dart';

class OperationTypeSelectionScreen
    extends BaseScreen<OperationTypeSelectionBloc> {
  OperationTypeSelectionScreen(OperationTypeSelectionRouteArgs argument);

  @override
  Widget build(BuildContext context) {
    return OperationTypeSelectionView();
  }

  @override
  OperationTypeSelectionBloc buildBloc(BuildContext context) {
    return OperationTypeSelectionBloc();
  }
}
