import 'package:my_finance_flutter/core/data_source/storage/entity/operation_state/operation_state_entity.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';

class OperationStateConverter {
  static OperationStateEntity toEntity(OperationStateModel model) {
    var entity = OperationStateEntity();
    entity.id = model.id;
    entity.title = model.title;
    return entity;
  }

  static OperationStateModel toModel(
    OperationStateEntity entity,
  ) {
    return OperationStateModel(
      id: entity.id,
      title: entity.title,
    );
  }
}
