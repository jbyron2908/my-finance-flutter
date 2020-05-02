import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';

class LabelConverter {
  static LabelEntity toEntity(LabelModel model) {
    return LabelEntity(
      id: model.id,
      remoteId: model.remoteId,
      deleted: model.deleted,
      name: model.name,
    );
  }

  static LabelModel toModel(LabelEntity entity) {
    return LabelModel(
      id: entity.id,
      remoteId: entity.remoteId,
      deleted: entity.deleted,
      name: entity.name,
    );
  }
}
