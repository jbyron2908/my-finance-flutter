import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/model/tag/model.dart';

class TagConverter {
  static TagEntity toEntity(TagModel model) {
    return TagEntity(
      id: model.id,
      name: model.name,
      remoteId: model.remoteId,
    );
  }

  static TagModel toModel(TagEntity entity) {
    return TagModel(
      id: entity.id,
      name: entity.name,
      remoteId: entity.remoteId,
    );
  }
}
