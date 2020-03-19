import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/table.dart';
import 'package:my_finance_flutter/core/model/category/model.dart';

part 'dao.g.dart';

@UseDao(tables: [CategoryTable])
class CategoryDao extends DatabaseAccessor<DatabaseClient>
    with _$CategoryDaoMixin {
  CategoryDao(DatabaseClient database) : super(database);

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
