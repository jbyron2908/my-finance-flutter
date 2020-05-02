import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/bookmark_operation/bookmark_operation_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_table.dart';
import 'package:my_finance_flutter/core/model/bookmark_operation/bookmark_operation_converter.dart';
import 'package:my_finance_flutter/core/model/bookmark_operation/bookmark_operation_model.dart';

part 'bookmark_operation_dao.g.dart';

@UseDao(tables: [
  BookmarkOperationTable,
  PayeeTable,
  CategoryTable,
])
class BookmarkOperationDao extends DatabaseAccessor<DatabaseClient>
    with _$BookmarkOperationDaoMixin {
  BookmarkOperationDao(DatabaseClient db) : super(db);

  Future<int> insert(BookmarkOperationEntity entity) {
    return into(bookmarkOperationTable).insert(entity);
  }

  Stream<List<BookmarkOperationModel>> watchAll() {
    var query = _getBaseQuery();

    query
      ..where(
        bookmarkOperationTable.deleted.equals(false),
      );

    return _mapQuery(query);
  }

  // Base

  $CategoryTableTable get parentCategoryAlias => alias(categoryTable, 'parent');

  JoinedSelectStatement _getBaseQuery() {
    return select(bookmarkOperationTable).join(
      [
        leftOuterJoin(
          payeeTable,
          payeeTable.id.equalsExp(bookmarkOperationTable.payee),
        ),
        leftOuterJoin(
          categoryTable,
          categoryTable.id.equalsExp(
            bookmarkOperationTable.category,
          ),
        ),
        leftOuterJoin(
          parentCategoryAlias,
          parentCategoryAlias.id.equalsExp(categoryTable.parent),
        ),
      ],
    );
  }

  Stream<List<BookmarkOperationModel>> _mapQuery(JoinedSelectStatement query) {
    return query.watch().map((rows) {
      return rows.map(
        (resultRow) {
          return BookmarkOperationConverter.toModel(
            resultRow.readTable(bookmarkOperationTable),
            payee: resultRow.readTable(payeeTable),
            category: resultRow.readTable(categoryTable),
            parentCategory: resultRow.readTable(parentCategoryAlias),
          );
        },
      ).toList();
    });
  }
}
