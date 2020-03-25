import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/category/index.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CategoryRepository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, CategoryRepository>(
        update: (context, databaseClient, postRepository) =>
            CategoryRepository(databaseClient),
      );

  static CategoryRepository of(BuildContext context) =>
      Provider.of<CategoryRepository>(context, listen: false);

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
