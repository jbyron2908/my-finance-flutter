import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_table.dart';
import 'package:my_finance_flutter/core/model/payee/payee_converter.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';

part 'payee_dao.g.dart';

@UseDao(tables: [PayeeTable])
class PayeeDao extends BaseDao<PayeeEntity, PayeeModel> with _$PayeeDaoMixin {
  PayeeDao(DatabaseClient database) : super(database);

  @override
  Table get table => payeeTable;

  // Write

  Future markDelete(PayeeEntity entity) {
    var deletedPayee = entity.copyWith(
      deleted: true,
    );
    return update(payeeTable).replace(deletedPayee);
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
    var query = getBaseQuery();

    query
      ..where(
        payeeTable.deleted.equals(false),
      );

    return mapQuery(query);
  }

  // Base

  @override
  JoinedSelectStatement getBaseQuery() {
    return select(payeeTable).join([]);
  }

  @override
  Stream<List<PayeeModel>> mapQuery(
    JoinedSelectStatement query,
  ) {
    return query.watch().map(
      (rows) {
        return rows.map(
          (resultRow) {
            return PayeeConverter.toModel(
              resultRow.readTable(payeeTable),
            );
          },
        ).toList();
      },
    );
  }
}
