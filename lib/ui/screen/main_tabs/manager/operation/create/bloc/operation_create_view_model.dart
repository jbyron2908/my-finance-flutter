import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
import 'package:provider/src/provider.dart';

class OperationCreateViewModel extends ChangeNotifier {
  static OperationCreateViewModel of(BuildContext context) =>
      Provider.of<OperationCreateViewModel>(context);

  OperationCreateViewModel(OperationModel operation) {
    this.operation = operation;
  }

  OperationModel _operation;

  OperationModel get operation => _operation;

  set operation(OperationModel operation) {
    _operation = operation;
    notifyListeners();
  }
}
