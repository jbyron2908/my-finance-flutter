import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:provider/provider.dart';

class CategoryRepository {
  static CategoryRepository of(BuildContext context) =>
      Provider.of<CategoryRepository>(context);

  CategoryRepository(this._databaseClient) {
    _categoryListStream = _databaseClient.categoryDao.watchAll();
  }

  DatabaseClient _databaseClient;

  Stream<List<CategoryEntity>> _categoryListStream;
  Stream<List<CategoryModel>> get categoryListStream => _categoryListStream.map(
        (categoryEntityList) => categoryEntityList
            .map(
              (entity) => CategoryConverter.toModel(entity),
            )
            .toList(),
      );

  Future<int> save(CategoryModel model) async {
    return _databaseClient.categoryDao.insert(
      CategoryConverter.toEntity(model),
    );
  }
}
