import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/constants/operation_state/operation_state_constants.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class OperationStateRepository {
  static SingleChildWidget buildProvider() => Provider.value(
        value: OperationStateRepository(),
      );

  static OperationStateRepository of(BuildContext context) =>
      Provider.of<OperationStateRepository>(context);

  OperationStateModel getDefault() {
    return OperationStateConstants.getDefault();
  }
}
