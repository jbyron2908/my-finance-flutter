import 'package:get/get.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/category/category_converter.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';

class CategoryRepository {
  final DatabaseClient _databaseClient = Get.find();

  CategoryRepository() {
    _categoryListStream = _databaseClient.categoryDao.watchAll();
  }

  Stream<List<CategoryModel>> _categoryListStream;
  Stream<List<CategoryModel>> get categoryListStream => _categoryListStream;

  Future save(CategoryModel category) async {
    return _databaseClient.categoryDao.save(
      CategoryConverter.toEntity(category),
    );
  }

  Future delete(CategoryModel category) async {
    return _databaseClient.categoryDao
        .markDelete(CategoryConverter.toEntity(category));
  }
}
