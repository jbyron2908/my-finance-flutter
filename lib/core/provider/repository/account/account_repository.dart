import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';
import 'package:provider/provider.dart';

class AccountRepository {
  static AccountRepository of(BuildContext context) =>
      Provider.of<AccountRepository>(context);

  AccountRepository(this._databaseClient);

  DatabaseClient _databaseClient;

  AccountEntityBean get _accountBean {
    return _databaseClient.accountBean;
  }

  Future<AccountEntity> save(AccountEntity account) async {
    return _accountBean.upsert(account);
  }

  Future<List<AccountEntity>> readAll() async {
    return await _accountBean.getAll();
  }
}
