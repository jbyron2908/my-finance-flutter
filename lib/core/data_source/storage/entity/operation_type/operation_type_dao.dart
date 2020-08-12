import 'package:hive/hive.dart';
import 'package:my_finance_flutter/core/data_source/storage/entity/operation_type/operation_type_entity.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_converter.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';

class OperationTypeDao {
  Box<OperationTypeEntity> box;

  Future<void> init() async {
    box = await Hive.openBox<OperationTypeEntity>('operationType');
  }

  OperationTypeModel getLastUsed() {
    var entity = box.get(
      'defaultOperationType',
      defaultValue: getDefault(),
    );

    return OperationTypeConverter.toModel(entity);
  }

  Future<void> updateLastUsed(OperationTypeModel model) async {
    await box.put(
      'defaultOperationType',
      OperationTypeConverter.toEntity(model),
    );
  }

  OperationTypeEntity getDefault() {
    var operationTypeEntity = OperationTypeEntity();
    operationTypeEntity.id = 'deposit';
    operationTypeEntity.title = 'Deposit';

    return operationTypeEntity;
  }
}
