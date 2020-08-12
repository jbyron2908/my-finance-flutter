import 'package:my_finance_flutter/core/data_source/storage/entity/operation_type/operation_type_entity.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';

class OperationTypeConverter {
  static OperationTypeEntity toEntity(OperationTypeModel model) {
    var entity = OperationTypeEntity();
    entity.id = model.id;
    entity.title = model.title;
    return entity;
  }

  static OperationTypeModel toModel(
    OperationTypeEntity entity,
  ) {
    return OperationTypeModel(
      id: entity.id,
      title: entity.title,
    );
  }
}
