import 'package:my_finance_flutter/core/constants/operation_state/operation_state_constants.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';

class OperationStateRepository {
  OperationStateModel getDefault() {
    return OperationStateConstants.getDefault();
  }
}
