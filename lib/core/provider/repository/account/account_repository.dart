import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/account/account_converter.dart';
import 'package:my_finance_flutter/core/provider/model/account/account_model.dart';
import 'package:provider/provider.dart';

class AccountRepository {
  static SingleChildCloneableWidget buildProvider() =>
      ProxyProvider<DatabaseClient, AccountRepository>(
        builder: (context, databaseClient, postRepository) =>
            AccountRepository(databaseClient),
      );

  static AccountRepository of(BuildContext context) =>
      Provider.of<AccountRepository>(context);

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
