import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';

abstract class BaseDao<Entity extends DataClass, Model>
    extends DatabaseAccessor<DatabaseClient> {
  BaseDao(DatabaseClient attachedDatabase) : super(attachedDatabase);

  Table get table;

  // Write

  Future save(Insertable entity) {
    return into(table).insertOnConflictUpdate(entity);
  }

  Future saveAll(List<Insertable> list) {
    return batch(
      (b) => b.insertAllOnConflictUpdate(table, list),
    );
  }

  Future clearAll() {
    return delete(table).go();
  }

  // Base

  JoinedSelectStatement getBaseQuery();
  Stream<List<Model>> mapQuery(JoinedSelectStatement query);
}
