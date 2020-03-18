import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/model/operation/operation_converter.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:provider/provider.dart';

class OperationRepository {
  static SingleChildCloneableWidget buildProvider() =>
      ProxyProvider<DatabaseClient, OperationRepository>(
        builder: (context, databaseClient, operationRepository) =>
            OperationRepository(databaseClient),
      );

  static OperationRepository of(BuildContext context) =>
      Provider.of<OperationRepository>(context);

  OperationRepository(this._databaseClient) {
    _operationListStream = _databaseClient.operationDao.watchAll();
  }

  Stream<List<OperationModel>> _operationListStream;
  Stream<List<OperationModel>> get operationListStream => _operationListStream;

  DatabaseClient _databaseClient;

  Future<int> save(OperationModel operation) async {
    operation.profile = operation.account.profile;
    return _databaseClient.operationDao
        .insert(OperationConverter.toEntity(operation));
  }

  Stream<List<OperationModel>> watchFilter(int accountId) {
    return _databaseClient.operationDao.watchFilter(accountId);
  }
}
