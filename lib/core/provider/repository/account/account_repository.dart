import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:provider/provider.dart';

class AccountRepository {
  static AccountRepository of(BuildContext context) =>
      Provider.of<AccountRepository>(context);

  DatabaseClient _databaseClient;

  AccountRepository(this._databaseClient) {
    _accountListStream = _databaseClient.accountDao.watchAll();
  }

  Stream<List<AccountEntity>> _accountListStream;
  Stream<List<AccountModel>> get accountListStream => _accountListStream.map(
        (accountEntityList) => accountEntityList != null
            ? accountEntityList
                .map((entity) => AccountConverter.toModel(entity))
                .toList()
            : List(),
      );

  Future<int> save(AccountModel account) async {
    return _databaseClient.accountDao
        .insert(AccountConverter.toEntity(account));
  }
}
