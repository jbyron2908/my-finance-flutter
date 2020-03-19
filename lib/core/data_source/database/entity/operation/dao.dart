import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/operation/table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/table.dart';
import 'package:my_finance_flutter/core/model/operation/converter.dart';
import 'package:my_finance_flutter/core/model/operation/model.dart';

part 'dao.g.dart';

@UseDao(tables: [OperationTable, CategoryTable, AccountTable, ProfileTable])
class OperationDao extends DatabaseAccessor<DatabaseClient>
    with _$OperationDaoMixin {
  OperationDao(DatabaseClient database) : super(database);

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
        profileTable,
        profileTable.id.equalsExp(operationTable.profile),
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
