import 'package:get/get.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/account/account_converter.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';

class AccountRepository {
  final DatabaseClient _databaseClient = Get.find();

  AccountRepository() {
    _accountListStream = _databaseClient.accountDao.watchAll();
  }

  Stream<List<AccountModel>> _accountListStream;
  Stream<List<AccountModel>> get accountListStream => _accountListStream;

  Future save(AccountModel account) async {
    return _databaseClient.accountDao.save(
      AccountConverter.toEntity(account),
    );
  }

  Future delete(AccountModel account) async {
    return _databaseClient.accountDao
        .markDelete(AccountConverter.toEntity(account));
  }
}
