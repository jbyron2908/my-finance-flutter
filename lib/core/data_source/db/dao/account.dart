import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';

part 'account.g.dart';

@UseDao(tables: [AccountTable])
class AccountDao extends DatabaseAccessor<DatabaseClient>
    with _$AccountDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  AccountDao(DatabaseClient db) : super(db);

  Future<int> insert(AccountEntity accountEntity) {
    return into(accountTable).insert(accountEntity);
  }

  Future<List<AccountEntity>> getAll() {
    return select(accountTable).get();
  }
}
