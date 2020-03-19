import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/constants/operation_type/constants.dart';
import 'package:my_finance_flutter/core/model/operation/type_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class OperationTypeRepository {
  static SingleChildWidget buildProvider() => Provider.value(
        value: OperationTypeRepository(),
      );

  static OperationTypeRepository of(BuildContext context) =>
      Provider.of<OperationTypeRepository>(context, listen: false);

  OperationTypeModel getDefault() {
    return OperationTypeConstants.getDefault();
  }
}
