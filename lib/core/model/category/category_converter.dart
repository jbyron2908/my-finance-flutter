import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/icon/icon_converter.dart';

class CategoryConverter {
  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(
      id: model.id,
      remoteId: model.remoteId,
      deleted: model.deleted,
      name: model.name,
      icon: IconConverter.toEntity(model.icon),
      parent: model?.parent?.id,
    );
  }

  static CategoryModel toModel(CategoryEntity entity, {CategoryEntity parent}) {
    return CategoryModel(
      id: entity.id,
      remoteId: entity.remoteId,
      deleted: entity.deleted,
      name: entity.name,
      icon: IconConverter.toModel(entity.icon),
      parent: parent != null ? toModel(parent) : null,
    );
  }
}
