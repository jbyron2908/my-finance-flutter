import 'package:hive/hive.dart';
import 'package:my_finance_flutter/core/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';

class OperationTypeDao {
  final Box box;

  OperationTypeDao(this.box);

  OperationTypeModel getLastUsed() {
    return OperationTypeModel.fromJson(
      box.get(
        'defaultOperationType',
        defaultValue: OperationTypeConstants.getDefault().toJson(),
      ),
    );
  }

  Future<void> updateLastUsed(OperationTypeModel operationType) async {
    await box.put('defaultOperationType', operationType.toJson());
  }
}
