import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/account/account_table.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/operation/operation_table.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/provider/model/operation_model.dart';

part 'operation_dao.g.dart';

@UseDao(tables: [OperationTable, CategoryTable, AccountTable, ProfileTable])
class OperationDao extends DatabaseAccessor<DatabaseClient>
    with _$OperationDaoMixin {
  OperationDao(DatabaseClient db) : super(db);

  Future<int> insert(OperationEntity entity) {
    return into(operationTable).insert(entity);
  }

  Stream<List<OperationModel>> watchAll() {
    final query = _getOperationBasicQuery();

    return _mapQueryToOperationModel(query);
  }

  Stream<List<OperationModel>> watchFilter(int accountId) {
    final query = _getOperationBasicQuery();

    query..where(accountTable.id.equals(accountId));

    return _mapQueryToOperationModel(query);
  }

  JoinedSelectStatement _getOperationBasicQuery() {
    return select(operationTable).join([
      leftOuterJoin(
        categoryTable,
        categoryTable.id.equalsExp(
          operationTable.category,
        ),
      ),
      leftOuterJoin(
        accountTable,
        accountTable.id.equalsExp(operationTable.account),
      ),
      leftOuterJoin(
        accountTable,
        accountTable.id.equalsExp(operationTable.account),
      ),
    ]);
  }

  Stream<List<OperationModel>> _mapQueryToOperationModel(
      JoinedSelectStatement query) {
    return query.watch().map((rows) {
      return rows.map(
        (resultRow) {
          return OperationConverter.toModel(
            resultRow.readTable(operationTable),
            category: resultRow.readTable(categoryTable),
            account: resultRow.readTable(accountTable),
          );
        },
      ).toList();
    });
  }
}
