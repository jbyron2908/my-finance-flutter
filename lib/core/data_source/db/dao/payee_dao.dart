import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/table/payee_table.dart';
import 'package:my_finance_flutter/core/provider/model/payee_model.dart';

part 'payee_dao.g.dart';

@UseDao(tables: [PayeeTable])
class PayeeDao extends DatabaseAccessor<DatabaseClient> with _$PayeeDaoMixin {
  PayeeDao(DatabaseClient db) : super(db);

  Future<int> insert(PayeeEntity entity) {
    return into(payeeTable).insert(entity);
  }

  Stream<List<PayeeModel>> watchAll() {
    return select(payeeTable).watch().map((rows) {
      return rows.map(
        (resultRow) {
          return PayeeConverter.toModel(
            resultRow,
          );
        },
      ).toList();
    });
  }
}
