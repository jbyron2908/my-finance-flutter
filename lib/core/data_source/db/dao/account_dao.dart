import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/table/account_table.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';

part 'account_dao.g.dart';

@UseDao(tables: [AccountTable])
class AccountDao extends DatabaseAccessor<DatabaseClient>
    with _$AccountDaoMixin {
  AccountDao(DatabaseClient db) : super(db);

  Future<int> insert(AccountEntity entity) {
    return into(accountTable).insert(entity);
  }

  Stream<List<AccountModel>> watchAll() {
    return select(accountTable).watch().map(
          (rows) => rows
              .map(
                (entity) => AccountConverter.toModel(entity),
              )
              .toList(),
        );
  }
}
