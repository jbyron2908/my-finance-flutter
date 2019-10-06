import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  int id;
  int remoteId;
  String name;
  CategoryModel parent;

  CategoryModel();

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

class CategoryConverter {
  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(
      id: model.id,
      name: model.name,
      parent: model?.parent?.id,
      remoteId: model.remoteId,
    );
  }

  static CategoryModel toModel(CategoryEntity entity) {
    return CategoryModel()
      ..id = entity.id
      ..name = entity.name
      ..remoteId = entity.remoteId;
  }
}
