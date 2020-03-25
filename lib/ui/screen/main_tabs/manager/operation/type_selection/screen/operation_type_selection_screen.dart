import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/bloc/operation_type_selection_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/widget/operation_type_selection_view.dart';
import 'package:provider/provider.dart';

class OperationTypeSelectionScreen extends BaseScreen<
    OperationTypeSelectionBloc, OperationTypeSelectionScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return OperationTypeSelectionView();
  }

  @override
  OperationTypeSelectionBloc buildBloc(BuildContext context) {
    return OperationTypeSelectionBloc();
  }
}

class OperationTypeSelectionScreenArgs {
  static OperationTypeSelectionScreenArgs of(BuildContext context) =>
      Provider.of<OperationTypeSelectionScreenArgs>(context, listen: false);

  int field1;

  OperationTypeSelectionScreenArgs({
    this.field1,
  });
}
