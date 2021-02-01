import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/model/category/category_converter.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';

part 'category_dao.g.dart';

@UseDao(tables: [CategoryTable])
class CategoryDao extends BaseDao<CategoryEntity, CategoryModel>
    with _$CategoryDaoMixin {
  CategoryDao(DatabaseClient database) : super(database);

  @override
  Table get table => categoryTable;

  // Write

  Future markDelete(CategoryEntity entity) {
    var deletedCategory = entity.copyWith(
      deleted: true,
    );
    return update(categoryTable).replace(deletedCategory);
  }

  // Read

  Stream<List<CategoryModel>> watchAll() {
    final query = getBaseQuery();

    query
      ..where(
        categoryTable.deleted.equals(false),
      );

    return mapQuery(query);
  }

  // Base

  $CategoryTableTable get parentAlias => alias(categoryTable, 'parent');

  @override
  JoinedSelectStatement getBaseQuery() {
    return select(categoryTable).join(
      [
        leftOuterJoin(
          parentAlias,
          parentAlias.id.equalsExp(categoryTable.parent),
        ),
      ],
    );
  }

  @override
  Stream<List<CategoryModel>> mapQuery(
    JoinedSelectStatement query,
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
