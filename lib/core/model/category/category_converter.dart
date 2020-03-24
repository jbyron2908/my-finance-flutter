import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';

class CategoryConverter {
  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(
      id: model.id,
      name: model.name,
      parent: model?.parent?.id,
      remoteId: model.remoteId,
    );
  }

  static CategoryModel toModel(CategoryEntity entity, {CategoryEntity parent}) {
    return CategoryModel(
      id: entity.id,
      remoteId: entity.remoteId,
      name: entity.name,
      parent: parent != null ? toModel(parent) : null,
    );
  }
}
