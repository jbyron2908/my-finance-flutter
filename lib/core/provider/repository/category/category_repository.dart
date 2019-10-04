import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:provider/provider.dart';

class CategoryRepository {
  static CategoryRepository of(BuildContext context) =>
      Provider.of<CategoryRepository>(context);

  CategoryRepository(this._databaseClient);

  DatabaseClient _databaseClient;

  Future<int> save(CategoryEntity category) async {
    return _databaseClient.categoryDao.insert(category);
  }

  Future<List<CategoryEntity>> readAll() async {
    return _databaseClient.categoryDao.getAll();
  }
}
