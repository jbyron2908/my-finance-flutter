import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/provider/model/operation/operation_type_model.dart';
import 'package:provider/provider.dart';

class OperationTypeRepository {
  static SingleChildCloneableWidget buildProvider() => Provider.value(
        value: OperationTypeRepository(),
      );

  static OperationTypeRepository of(BuildContext context) =>
      Provider.of<OperationTypeRepository>(context);

  OperationTypeModel getDefault() {
    return OperationTypeConstants.getDefault();
  }
}
