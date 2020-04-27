import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/model/category/index.dart';

part 'category_dao.g.dart';

@UseDao(tables: [CategoryTable])
class CategoryDao extends DatabaseAccessor<DatabaseClient>
    with _$CategoryDaoMixin {
  CategoryDao(DatabaseClient database) : super(database);

  // Write

  Future save(CategoryEntity entity) {
    if (entity.id == null) {
      return into(categoryTable).insert(entity);
    } else {
      return update(categoryTable).replace(entity);
    }
  }

  Future markDelete(CategoryEntity entity) {
    var deletedCategory = entity.copyWith(
      deleted: true,
    );
    return update(categoryTable).replace(deletedCategory);
  }

  // Read

  Stream<List<CategoryModel>> watchAll() {
    final query = _getBaseQuery();

    query
      ..where(
        categoryTable.deleted.equals(false),
      );

    return _mapQuery(query);
  }

  // Base

  $CategoryTableTable get parentAlias => alias(categoryTable, 'parent');

  JoinedSelectStatement<Table, DataClass> _getBaseQuery() {
    return select(categoryTable).join(
      [
        leftOuterJoin(
          parentAlias,
          parentAlias.id.equalsExp(categoryTable.parent),
        ),
      ],
    );
  }

  Stream<List<CategoryModel>> _mapQuery(
    JoinedSelectStatement<Table, DataClass> query,
  ) {
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
