import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';

part '{{snakeCase name}}_model.g.dart';

@JsonSerializable()
class {{pascalCase name}}Model {
  int id;
  int remoteId;
  String name;

  {{pascalCase name}}Model();

  factory {{pascalCase name}}Model.fromJson(Map<String, dynamic> json) =>
      _${{pascalCase name}}ModelFromJson(json);

  Map<String, dynamic> toJson() => _${{pascalCase name}}ModelToJson(this);
}

class {{pascalCase name}}Converter {
  static {{pascalCase name}}Entity toEntity({{pascalCase name}}Model model) {
    return {{pascalCase name}}Entity(
      id: model.id,
      name: model.name,
      remoteId: model.remoteId,
    );
  }

  static {{pascalCase name}}Model toModel({{pascalCase name}}Entity entity) {
    return {{pascalCase name}}Model()
      ..id = entity.id
      ..name = entity.name
      ..remoteId = entity.remoteId;
  }
}
