import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';

part 'tag_model.g.dart';

@JsonSerializable()
class TagModel {
  int id;
  int remoteId;
  String name;

  TagModel();

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  Map<String, dynamic> toJson() => _$TagModelToJson(this);
}

class TagConverter {
  static TagEntity toEntity(TagModel model) {
    return TagEntity(
      id: model.id,
      name: model.name,
      remoteId: model.remoteId,
    );
  }

  static TagModel toModel(TagEntity entity) {
    return TagModel()
      ..id = entity.id
      ..name = entity.name
      ..remoteId = entity.remoteId;
  }
}
