import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_finance_flutter/core/data_source/storage/entity/operation_state/operation_state_dao.dart';
import 'package:my_finance_flutter/core/data_source/storage/entity/operation_state/operation_state_entity.dart';
import 'package:my_finance_flutter/core/data_source/storage/entity/operation_type/operation_type_dao.dart';
import 'package:my_finance_flutter/core/data_source/storage/entity/operation_type/operation_type_entity.dart';

class StorageClient {
  static StorageClient _instance;
  static StorageClient get instance {
    _instance ??= StorageClient();
    return _instance;
  }

  OperationTypeDao operationTypeDao;
  OperationStateDao operationStateDao;

  Future<void> init() async {
    await Hive.initFlutter();

    _registerAdapters();
    _initDaos();
  }

  void _registerAdapters() {
    Hive.registerAdapter(OperationTypeEntityAdapter());
    Hive.registerAdapter(OperationStateEntityAdapter());
  }

  void _initDaos() async {
    operationTypeDao = OperationTypeDao();
    await operationTypeDao.init();

    operationStateDao = OperationStateDao();
    await operationStateDao.init();
  }
}
