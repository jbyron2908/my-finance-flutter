import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/model/operation.dart';

part 'operation.g.dart';

@UseDao(tables: [OperationTable])
class OperationDao extends DatabaseAccessor<DatabaseClient>
    with _$OperationDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  OperationDao(DatabaseClient db) : super(db);

  Future<int> insert(OperationEntity operationEntity) {
    return into(operationTable).insert(operationEntity);
  }

  Future<List<OperationEntity>> getAll() {
    return select(operationTable).get();
  }
}
