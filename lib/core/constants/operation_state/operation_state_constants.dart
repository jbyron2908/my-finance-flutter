import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';

class OperationStateConstants {
  static List<OperationStateModel> operationStateList = [
    OperationStateModel(id: "paid", title: "Paid"),
    OperationStateModel(id: "pending", title: "Pending"),
  ];

  static OperationStateModel getDefault() {
    return OperationStateModel(id: "paid", title: "Paid");
  }

  static OperationStateModel getById(String id) {
    return operationStateList.firstWhere(
          (item) => item.id == id,
        ) ??
        getDefault();
  }
}
