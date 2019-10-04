import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:provider/provider.dart';

class AccountRepository {
  static AccountRepository of(BuildContext context) =>
      Provider.of<AccountRepository>(context);

  AccountRepository(this._databaseClient);

  DatabaseClient _databaseClient;

  Future<int> save(AccountEntity account) async {
    return _databaseClient.accountDao.insert(account);
  }

  Future<List<AccountEntity>> readAll() async {
    return _databaseClient.accountDao.getAll();
  }
}
