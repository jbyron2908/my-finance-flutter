import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';

class OperationStateConstants {
  static OperationStateModel paid =
      OperationStateModel(id: 'paid', title: 'Paid');

  static OperationStateModel pending =
      OperationStateModel(id: 'pending', title: 'Pending');

  static List<OperationStateModel> operationStateList = [
    paid,
    pending,
  ];

  static OperationStateModel getDefault() {
    return paid;
  }

  static OperationStateModel getById(String id) {
    return operationStateList.firstWhere(
          (item) => item.id == id,
        ) ??
        getDefault();
  }
}
