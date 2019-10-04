import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:provider/provider.dart';

class UserRepository {
  static UserRepository of(BuildContext context) =>
      Provider.of<UserRepository>(context);

  UserRepository(this._databaseClient);

  DatabaseClient _databaseClient;

  Future<int> save(UserEntity user) async {
    return _databaseClient.userDao.insert(user);
  }

  Future<List<UserEntity>> readAll() async {
    return _databaseClient.userDao.getAll();
  }
}
