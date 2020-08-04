import 'package:my_finance_flutter/core/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';

class OperationTypeRepository {
  OperationTypeModel getDefault() {
    return OperationTypeConstants.getDefault();
  }
}
