import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/operation_model.dart';
import 'package:provider/provider.dart';

class OperationRepository {
  static OperationRepository of(BuildContext context) =>
      Provider.of<OperationRepository>(context);

  OperationRepository(this._databaseClient) {
    _operationListStream = _databaseClient.operationDao.watchAll();
  }

  Stream<List<OperationModel>> _operationListStream;
  Stream<List<OperationModel>> get operationListStream => _operationListStream;

  DatabaseClient _databaseClient;

  Future<int> save(OperationModel operation) async {
    return _databaseClient.operationDao
        .insert(OperationConverter.toEntity(operation));
  }
}
