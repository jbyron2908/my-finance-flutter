import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/model/category.dart';
import 'package:provider/provider.dart';

class CategoryRepository {
  static CategoryRepository of(BuildContext context) =>
      Provider.of<CategoryRepository>(context);

  CategoryRepository(this._databaseClient);

  DatabaseClient _databaseClient;

  CategoryEntityBean get _categoryBean {
    return _databaseClient.categoryBean;
  }

  Future<CategoryEntity> save(CategoryEntity category) async {
    return _categoryBean.upsert(category);
  }

  Future<List<CategoryEntity>> readAll() async {
    return await _categoryBean.getAll();
  }
}
