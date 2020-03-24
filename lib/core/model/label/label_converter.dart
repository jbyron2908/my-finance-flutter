import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';

class LabelConverter {
  static LabelEntity toEntity(LabelModel model) {
    return LabelEntity(
      id: model.id,
      name: model.name,
      remoteId: model.remoteId,
    );
  }

  static LabelModel toModel(LabelEntity entity) {
    return LabelModel(
      id: entity.id,
      name: entity.name,
      remoteId: entity.remoteId,
    );
  }
}
