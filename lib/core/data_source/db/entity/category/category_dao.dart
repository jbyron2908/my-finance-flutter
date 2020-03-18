import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';

part 'category_dao.g.dart';

@UseDao(tables: [CategoryTable])
class CategoryDao extends DatabaseAccessor<DatabaseClient>
    with _$CategoryDaoMixin {
  CategoryDao(DatabaseClient db) : super(db);

  Future<int> insert(CategoryEntity entity) {
    return into(categoryTable).insert(entity);
  }

  Stream<List<CategoryModel>> watchAll() {
    final parentAlias = alias(categoryTable, 'parent');

    final query = select(categoryTable).join([
      leftOuterJoin(
          parentAlias, parentAlias.id.equalsExp(categoryTable.parent)),
    ]);

    return query.watch().map((rows) {
      return rows.map(
        (resultRow) {
          return CategoryConverter.toModel(
            resultRow.readTable(categoryTable),
            parent: resultRow.readTable(parentAlias),
          );
        },
      ).toList();
    });
  }
}
