import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AccountRepository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, AccountRepository>(
        update: (context, databaseClient, postRepository) =>
            AccountRepository(databaseClient),
      );

  static AccountRepository of(BuildContext context) =>
      Provider.of<AccountRepository>(context, listen: false);

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