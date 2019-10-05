import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/account.dart';
import 'package:provider/provider.dart';

class AccountRepository {
  static AccountRepository of(BuildContext context) =>
      Provider.of<AccountRepository>(context);

  Stream<List<AccountEntity>> _accountListStream;
  DatabaseClient _databaseClient;

  AccountRepository(this._databaseClient) {
    _accountListStream = _databaseClient.accountDao.getAll();
  }

  Stream<List<AccountEntity>> get accountListStream => _accountListStream;

  Future<int> save(AccountModel account) async {
    return _databaseClient.accountDao
        .insert(AccountConverter.toEntity(account));
  }
}
