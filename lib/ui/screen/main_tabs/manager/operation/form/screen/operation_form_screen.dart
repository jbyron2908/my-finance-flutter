import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/bloc/operation_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_form_view.dart';

class OperationFormScreen
    extends BaseScreen<OperationFormBloc, OperationFormRouteArgs> {
  @override
  Widget build(BuildContext context) {
    return OperationFormView();
  }

  @override
  OperationFormBloc buildBloc(BuildContext context) {
    var argument = getArgument(context);

    return OperationFormBloc(
      context: context,
      operation: argument.operation,
    );
  }
}
