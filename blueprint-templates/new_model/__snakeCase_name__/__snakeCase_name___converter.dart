import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';

class {{pascalCase name}}Converter {
  static {{pascalCase name}}Entity toEntity({{pascalCase name}}Model model) {
    return {{pascalCase name}}Entity(
      id: model.id,
      name: model.name,
      remoteId: model.remoteId,
    );
  }

  static {{pascalCase name}}Model toModel({{pascalCase name}}Entity entity) {
    return {{pascalCase name}}Model(
      id: entity.id,
      name: entity.name,
      remoteId: entity.remoteId,
    );
  }
}
