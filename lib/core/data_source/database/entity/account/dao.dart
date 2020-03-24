import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/table.dart';
import 'package:my_finance_flutter/core/model/account/account_converter.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';

part 'dao.g.dart';

@UseDao(tables: [AccountTable, ProfileTable])
class AccountDao extends DatabaseAccessor<DatabaseClient>
    with _$AccountDaoMixin {
  AccountDao(DatabaseClient database) : super(database);

  Future<int> insert(AccountEntity entity) {
    return into(accountTable).insert(entity);
  }

  Stream<List<AccountModel>> watchAll() {
    var query = _getAccountBasicQuery();
    return _mapQueryToAccountModel(query);
  }

  JoinedSelectStatement _getAccountBasicQuery() {
    return select(accountTable).join([
      leftOuterJoin(
        profileTable,
        profileTable.id.equalsExp(
          accountTable.profile,
        ),
      ),
    ]);
  }

  Stream<List<AccountModel>> _mapQueryToAccountModel(
      JoinedSelectStatement query) {
    return query.watch().map((rows) {
      return rows.map(
        (resultRow) {
          return AccountConverter.toModel(
            resultRow.readTable(accountTable),
            profile: resultRow.readTable(profileTable),
          );
        },
      ).toList();
    });
  }
}
