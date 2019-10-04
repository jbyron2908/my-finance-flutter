import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:provider/provider.dart';

class OperationRepository {
  static OperationRepository of(BuildContext context) =>
      Provider.of<OperationRepository>(context);

  OperationRepository(this._databaseClient);

  DatabaseClient _databaseClient;

  Future<int> save(OperationEntity operation) async {
    return _databaseClient.operationDao.insert(operation);
  }

  Future<List<OperationEntity>> readAll() async {
    return _databaseClient.operationDao.getAll();
  }
}
