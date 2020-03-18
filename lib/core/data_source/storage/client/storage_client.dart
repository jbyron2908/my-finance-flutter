import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance_flutter/core/data_source/storage/dao/operation/state/state_dao.dart';
import 'package:my_finance_flutter/core/data_source/storage/dao/operation/type/type_dao.dart';

class StorageClient {
  static StorageClient _instance;
  static StorageClient get instance {
    if (_instance == null) {
      _instance = StorageClient();
    }
    return _instance;
  }

  Box _defaultBox;

  OperationTypeDao operationTypeDao;
  OperationStateDao operationStateDao;

  Future<void> init() async {
    await Hive.initFlutter();
    _defaultBox = await Hive.openBox('default');
    _initDaos();
  }

  void _initDaos() {
    operationTypeDao = OperationTypeDao(_defaultBox);
    operationStateDao = OperationStateDao(_defaultBox);
  }
}
