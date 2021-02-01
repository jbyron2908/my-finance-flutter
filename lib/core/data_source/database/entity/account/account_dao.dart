import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/account_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/model/account/account_converter.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';

part 'account_dao.g.dart';

@UseDao(tables: [AccountTable, ProfileTable])
class AccountDao extends BaseDao<AccountEntity, AccountModel>
    with _$AccountDaoMixin {
  AccountDao(DatabaseClient database) : super(database);

  @override
  Table get table => accountTable;

  // Write

  Future markDelete(AccountEntity entity) {
    var deletedAccount = entity.copyWith(
      deleted: true,
    );
    return update(accountTable).replace(deletedAccount);
  }

  // Read

  Stream<List<AccountModel>> watchAll() {
    var query = getBaseQuery();

    query
      ..where(
        accountTable.deleted.equals(false),
      );

    return mapQuery(query);
  }

  // Base

  @override
  JoinedSelectStatement getBaseQuery() {
    return select(accountTable).join(
      [
        leftOuterJoin(
          profileTable,
          profileTable.id.equalsExp(
            accountTable.profile,
          ),
        ),
      ],
    )..where(accountTable.deleted.equals(false));
  }

  @override
  Stream<List<AccountModel>> mapQuery(JoinedSelectStatement query) {
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
