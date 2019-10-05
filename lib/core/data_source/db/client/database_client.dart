import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/dao/account.dart';
import 'package:my_finance_flutter/core/data_source/db/dao/category.dart';
import 'package:my_finance_flutter/core/data_source/db/dao/operation.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';
import 'package:my_finance_flutter/core/data_source/db/model/category.dart';
import 'package:my_finance_flutter/core/data_source/db/model/operation.dart';

part 'database_client.g.dart';

@UseMoor(
  tables: [CategoryTable, AccountTable, OperationTable],
  daos: [CategoryDao, AccountDao, OperationDao],
)
class DatabaseClient extends _$DatabaseClient {
  DatabaseClient()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;
}
