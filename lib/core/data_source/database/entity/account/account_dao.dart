import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/account_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';

part 'account_dao.g.dart';

@UseDao(tables: [AccountTable, ProfileTable])
class AccountDao extends DatabaseAccessor<DatabaseClient>
    with _$AccountDaoMixin {
  AccountDao(DatabaseClient database) : super(database);

  // Write

  Future save(AccountEntity entity) {
    if (entity.id == null) {
      return into(accountTable).insert(entity);
    } else {
      return update(accountTable).replace(entity);
    }
  }

  Future markDelete(AccountEntity entity) {
    var deletedAccount = entity.copyWith(
      deleted: true,
    );
    return update(accountTable).replace(deletedAccount);
  }

  // Read

  Stream<List<AccountModel>> watchAll() {
    var query = _getBaseQuery();

    query
      ..where(
        accountTable.deleted.equals(false),
      );

    return _mapQuery(query);
  }

  // Base

  JoinedSelectStatement _getBaseQuery() {
    return select(accountTable).join(
      [
        leftOuterJoin(
          profileTable,
          profileTable.id.equalsExp(
            accountTable.profile,
          ),
        ),
      ],
    );
  }

  Stream<List<AccountModel>> _mapQuery(JoinedSelectStatement query) {
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
