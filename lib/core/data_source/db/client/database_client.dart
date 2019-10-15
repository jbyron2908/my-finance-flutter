import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/dao/account_dao.dart';
import 'package:my_finance_flutter/core/data_source/db/dao/category_dao.dart';
import 'package:my_finance_flutter/core/data_source/db/dao/operation_dao.dart';
import 'package:my_finance_flutter/core/data_source/db/dao/payee_dao.dart';
import 'package:my_finance_flutter/core/data_source/db/table/account_table.dart';
import 'package:my_finance_flutter/core/data_source/db/table/category_table.dart';
import 'package:my_finance_flutter/core/data_source/db/table/operation_table.dart';
import 'package:my_finance_flutter/core/data_source/db/table/payee_table.dart';

part 'database_client.g.dart';

@UseMoor(
  tables: [CategoryTable, AccountTable, OperationTable, PayeeTable],
  daos: [CategoryDao, AccountDao, OperationDao, PayeeDao],
)
class DatabaseClient extends _$DatabaseClient {
  DatabaseClient()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;
}
