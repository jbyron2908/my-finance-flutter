import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/model/user.dart';
import 'package:provider/provider.dart';

class UserRepository {
  static UserRepository of(BuildContext context) =>
      Provider.of<UserRepository>(context);

  UserRepository(this._databaseClient);

  DatabaseClient _databaseClient;

  UserEntityBean get _userBean {
    return _databaseClient.userBean;
  }

  Future<UserEntity> save(UserEntity user) async {
    return _userBean.upsert(user);
  }

  Future<List<UserEntity>> readAll() async {
    return await _userBean.getAll();
  }
}
