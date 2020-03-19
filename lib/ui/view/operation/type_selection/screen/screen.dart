import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/operation/type_selection/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/operation/type_selection/screen/route.dart';
import 'package:my_finance_flutter/ui/view/operation/type_selection/widget/view.dart';

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
