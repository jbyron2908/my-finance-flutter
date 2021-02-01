import 'package:get/get.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/storage/client/storage_client.dart';
import 'package:my_finance_flutter/core/model/operation/operation_converter.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';

class OperationRepository {
  final DatabaseClient _databaseClient = Get.find();

  OperationRepository() {
    _operationListStream = _databaseClient.operationDao.watchAll();
  }

  Stream<List<OperationModel>> _operationListStream;
  Stream<List<OperationModel>> get operationListStream => _operationListStream;

  Future save(OperationModel operation) async {
    operation = operation.copyWith(profile: operation.account.profile);
    await _saveDefaultValues(operation);
    return _databaseClient.operationDao
        .save(OperationConverter.toEntity(operation));
  }

  Future saveAll(List<OperationModel> list) async {
    var entityList = list.map(
      (model) {
        var operation = model.copyWith(profile: model.account.profile);

        return OperationConverter.toEntity(operation);
      },
    ).toList();

    return _databaseClient.operationDao.saveAll(entityList);
  }

  Future delete(OperationModel operation) async {
    return _databaseClient.operationDao
        .markDelete(OperationConverter.toEntity(operation));
  }

  Future _saveDefaultValues(OperationModel operation) async {
    var storageClient = StorageClient.instance;
    await storageClient.operationTypeDao.updateLastUsed(operation.type);
    await storageClient.operationStateDao.updateLastUsed(operation.state);
  }

  Stream<List<OperationModel>> watchFilter(int accountId) {
    return _databaseClient.operationDao.watchFilter(accountId);
  }

  Future clearAll() {
    return _databaseClient.operationDao.clearAll();
  }
}
