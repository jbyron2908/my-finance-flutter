import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_table.dart';
import 'package:my_finance_flutter/core/model/payee/payee_converter.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';

part 'payee_dao.g.dart';

@UseDao(tables: [PayeeTable])
class PayeeDao extends DatabaseAccessor<DatabaseClient> with _$PayeeDaoMixin {
  PayeeDao(DatabaseClient database) : super(database);

  Future<int> insert(PayeeEntity entity) {
    return into(payeeTable).insert(entity);
  }

  Future<List<PayeeModel>> getAll() async {
    var payeeEntityList = await select(payeeTable).get();
    return payeeEntityList.map((entity) {
      return PayeeConverter.toModel(
        entity,
      );
    }).toList();
  }

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
        name: payeeName,
      );

      var id = await insert(payeeEntity);
      payeeModel = PayeeModel(id: id, name: payeeName);
    } else {
      payeeModel = PayeeConverter.toModel(payeeEntity);
    }
    return payeeModel;
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
