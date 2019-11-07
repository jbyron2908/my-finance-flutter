import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:provider/provider.dart';

class AccountRepository {
  static AccountRepository of(BuildContext context) =>
      Provider.of<AccountRepository>(context);

  static SingleChildCloneableWidget buildProvider() =>
      ProxyProvider<DatabaseClient, AccountRepository>(
        builder: (context, databaseClient, accountRepository) =>
            AccountRepository(databaseClient),
      );

  DatabaseClient _databaseClient;

  AccountRepository(this._databaseClient) {
    _accountListStream = _databaseClient.accountDao.watchAll();
  }

  Stream<List<AccountModel>> _accountListStream;
  Stream<List<AccountModel>> get accountListStream => _accountListStream;

  Future<int> save(AccountModel account) async {
    return _databaseClient.accountDao.insert(
      AccountConverter.toEntity(account),
    );
  }
}
