import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/account.dart';
import 'package:provider/provider.dart';

class AccountRepository {
  static AccountRepository of(BuildContext context) =>
      Provider.of<AccountRepository>(context);

  AccountRepository(this._databaseClient);

  DatabaseClient _databaseClient;

  Future<int> save(AccountModel account) async {
    return _databaseClient.accountDao
        .insert(AccountConverter.toEntity(account));
  }

  Future<List<AccountEntity>> readAll() async {
    return _databaseClient.accountDao.getAll();
  }
}
