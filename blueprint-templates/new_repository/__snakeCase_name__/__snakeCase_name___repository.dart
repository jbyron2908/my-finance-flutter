import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class {{pascalCase name}}Repository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, {{pascalCase name}}Repository>(
        builder: (context, databaseClient, postRepository) =>
            {{pascalCase name}}Repository(databaseClient),
      );

  static {{pascalCase name}}Repository of(BuildContext context) =>
      Provider.of<{{pascalCase name}}Repository>(context);

  DatabaseClient _databaseClient;

  {{pascalCase name}}Repository(this._databaseClient) {
    _{{lowerCase name}}ListStream = _databaseClient.{{lowerCase name}}Dao.watchAll();
  }

  Stream<List<{{pascalCase name}}Model>> _{{lowerCase name}}ListStream;
  Stream<List<{{pascalCase name}}Model>> get {{lowerCase name}}ListStream => _{{lowerCase name}}ListStream;

  Future<int> save({{pascalCase name}}Model {{lowerCase name}}) async {
    return _databaseClient.{{lowerCase name}}Dao.insert(
      {{pascalCase name}}Converter.toEntity({{lowerCase name}}),
    );
  }
}
