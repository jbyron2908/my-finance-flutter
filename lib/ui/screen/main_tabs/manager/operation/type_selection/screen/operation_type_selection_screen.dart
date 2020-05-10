import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/bloc/operation_type_selection_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/screen/operation_type_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/widget/operation_type_selection_view.dart';

class OperationTypeSelectionScreen extends BaseScreen<
    OperationTypeSelectionBloc, OperationTypeSelectionRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return OperationTypeSelectionView();
  }

  @override
  OperationTypeSelectionBloc buildBloc(BuildContext context) {
    return OperationTypeSelectionBloc();
  }
}
