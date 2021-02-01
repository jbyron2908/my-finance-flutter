import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';

class OperationTypeConstants {
  static OperationTypeModel deposit =
      OperationTypeModel(id: 'deposit', title: 'Deposit');

  static OperationTypeModel withdrawal =
      OperationTypeModel(id: 'withdrawal', title: 'Withdrawal');

  static List<OperationTypeModel> operationTypeList = [
    deposit,
    withdrawal,
  ];

  static OperationTypeModel getDefault() {
    return deposit;
  }

  static OperationTypeModel getById(String id) {
    return operationTypeList.firstWhere(
          (item) => item.id == id,
        ) ??
        getDefault();
  }
}
