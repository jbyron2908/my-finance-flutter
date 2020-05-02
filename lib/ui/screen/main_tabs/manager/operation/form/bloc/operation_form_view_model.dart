import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:provider/src/provider.dart';

class OperationFormViewModel extends ChangeNotifier {
  static OperationFormViewModel of(BuildContext context) =>
      Provider.of<OperationFormViewModel>(context);

  OperationFormViewModel(OperationModel operation) {
    this.operation = operation;
  }

  OperationModel _operation;

  OperationModel get operation => _operation;

  set operation(OperationModel operation) {
    _operation = operation;
    notifyListeners();
  }
}
