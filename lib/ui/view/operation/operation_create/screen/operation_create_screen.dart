import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_create/screen/operation_create_bloc.dart';
import 'package:my_finance_flutter/ui/view/operation/operation_create/widget/operation_create_view.dart';

class OperationCreateScreen extends BaseScreen<OperationCreateBloc> {
  @override
  Widget build(BuildContext context) {
    return OperationCreateView();
  }

  @override
  OperationCreateBloc buildBloc(BuildContext context) {
    return OperationCreateBloc();
  }
}
