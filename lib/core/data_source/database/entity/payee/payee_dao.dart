import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_table.dart';
import 'package:my_finance_flutter/core/model/payee/payee_converter.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';

part 'payee_dao.g.dart';

@UseDao(tables: [PayeeTable])
class PayeeDao extends DatabaseAccessor<DatabaseClient> with _$PayeeDaoMixin {
  PayeeDao(DatabaseClient database) : super(database);

  // Write

  Future save(PayeeEntity entity) {
    if (entity.id == null) {
      return into(payeeTable).insert(entity);
    } else {
      return update(payeeTable).replace(entity);
    }
  }

  Future markDelete(PayeeEntity entity) {
    var deletedPayee = entity.copyWith(
      deleted: true,
    );
    return update(payeeTable).replace(deletedPayee);
  }

  Future clearAll() {
    return delete(payeeTable).go();
  }

  // Read

  Future<PayeeModel> getOrAdd(String payeeName) async {
    var payeeEntity = await (select(payeeTable)
          ..where(
            (payee) => payee.name.equals(payeeName),
          ))
        .getSingle();

    var payeeModel;
    if (payeeEntity == null) {
      payeeEntity = PayeeEntity(
        id: null,
        deleted: false,
        name: payeeName,
      );

      var id = await save(payeeEntity);
      payeeModel = PayeeModel(id: id, name: payeeName);
    } else {
      payeeModel = PayeeConverter.toModel(payeeEntity);
    }
    return payeeModel;
  }

  Stream<List<PayeeModel>> watchAll() {
    var query = _getBaseQuery();

    query
      ..where(
        (payee) => payee.deleted.equals(false),
      );

    return _mapQuery(query);
  }

  // Base

  SimpleSelectStatement<$PayeeTableTable, PayeeEntity> _getBaseQuery() {
    return select(payeeTable);
  }

  Stream<List<PayeeModel>> _mapQuery(
      SimpleSelectStatement<$PayeeTableTable, PayeeEntity> query) {
    return query.watch().map(
      (rows) {
        return rows.map(
          (resultRow) {
            return PayeeConverter.toModel(
              resultRow,
            );
          },
        ).toList();
      },
    );
  }
}
