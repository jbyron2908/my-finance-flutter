import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/constants/operation_state/operation_state_constants.dart';
import 'package:my_finance_flutter/core/provider/model/operation/operation_state_model.dart';
import 'package:provider/provider.dart';

class OperationStateRepository {
  static SingleChildCloneableWidget buildProvider() => Provider.value(
        value: OperationStateRepository(),
      );

  static OperationStateRepository of(BuildContext context) =>
      Provider.of<OperationStateRepository>(context);

  OperationStateModel getDefault() {
    return OperationStateConstants.getDefault();
  }
}
