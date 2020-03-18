import 'package:my_finance_flutter/core/provider/model/operation/operation_type_model.dart';

class OperationTypeConstants {
  static List<OperationTypeModel> operationTypeList = [
    OperationTypeModel(id: "deposit", title: "Deposit"),
    OperationTypeModel(id: "withdrawal", title: "Withdrawal"),
  ];

  static OperationTypeModel getDefault() {
    return OperationTypeModel(id: "deposit", title: "Deposit");
  }

  static OperationTypeModel getById(String id) {
    return operationTypeList.firstWhere(
          (item) => item.id == id,
        ) ??
        getDefault();
  }
}
