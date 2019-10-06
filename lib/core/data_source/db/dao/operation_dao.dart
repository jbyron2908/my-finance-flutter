import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/table/operation_table.dart';

part 'operation_dao.g.dart';

@UseDao(tables: [OperationTable])
class OperationDao extends DatabaseAccessor<DatabaseClient>
    with _$OperationDaoMixin {
  OperationDao(DatabaseClient db) : super(db);

  Future<int> insert(OperationEntity entity) {
    return into(operationTable).insert(entity);
  }

  Future<List<OperationEntity>> getAll() {
    return select(operationTable).get();
  }
}
