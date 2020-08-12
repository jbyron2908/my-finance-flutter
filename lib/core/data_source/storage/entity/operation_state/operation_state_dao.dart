import 'package:hive/hive.dart';
import 'package:my_finance_flutter/core/data_source/storage/entity/operation_state/operation_state_entity.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_converter.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';

class OperationStateDao {
  Box<OperationStateEntity> box;

  Future<void> init() async {
    box = await Hive.openBox<OperationStateEntity>('operationState');
  }

  OperationStateModel getLastUsed() {
    var entity = box.get(
      'defaultOperationState',
      defaultValue: getDefault(),
    );

    return OperationStateConverter.toModel(entity);
  }

  Future<void> updateLastUsed(OperationStateModel model) async {
    await box.put(
      'defaultOperationState',
      OperationStateConverter.toEntity(model),
    );
  }

  OperationStateEntity getDefault() {
    var operationTypeEntity = OperationStateEntity();
    operationTypeEntity.id = 'paid';
    operationTypeEntity.title = 'Paid';

    return operationTypeEntity;
  }
}
