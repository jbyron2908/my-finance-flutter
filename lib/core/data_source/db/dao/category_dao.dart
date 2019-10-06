import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/table/category_table.dart';

part 'category_dao.g.dart';

@UseDao(tables: [CategoryTable])
class CategoryDao extends DatabaseAccessor<DatabaseClient>
    with _$CategoryDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CategoryDao(DatabaseClient db) : super(db);

  Future<int> insert(CategoryEntity entity) {
    return into(categoryTable).insert(entity);
  }

  Stream<List<CategoryEntity>> watchAll() {
    return select(categoryTable).watch();
  }
}
