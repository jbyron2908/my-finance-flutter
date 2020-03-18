import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/category/category_model.dart';
import 'package:provider/provider.dart';

class CategoryRepository {
  static SingleChildCloneableWidget buildProvider() =>
      ProxyProvider<DatabaseClient, CategoryRepository>(
        builder: (context, databaseClient, postRepository) =>
            CategoryRepository(databaseClient),
      );

  static CategoryRepository of(BuildContext context) =>
      Provider.of<CategoryRepository>(context);

  CategoryRepository(this._databaseClient) {
    _categoryListStream = _databaseClient.categoryDao.watchAll();
  }

  DatabaseClient _databaseClient;

  Stream<List<CategoryModel>> _categoryListStream;
  Stream<List<CategoryModel>> get categoryListStream => _categoryListStream;

  Future<int> save(CategoryModel model) async {
    return _databaseClient.categoryDao.insert(
      CategoryConverter.toEntity(model),
    );
  }
}
