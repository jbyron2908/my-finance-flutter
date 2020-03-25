import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/account_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/operation/operation_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';

part 'operation_dao.g.dart';

@UseDao(tables: [
  OperationTable,
  PayeeTable,
  CategoryTable,
  AccountTable,
  ProfileTable,
])
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
        payeeTable,
        payeeTable.id.equalsExp(operationTable.payee),
      ),
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
            payee: resultRow.readTable(payeeTable),
            category: resultRow.readTable(categoryTable),
            account: resultRow.readTable(accountTable),
          );
        },
      ).toList();
    });
  }
}
