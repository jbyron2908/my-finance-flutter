import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/model/account.dart';
import 'package:my_finance_flutter/core/data_source/db/model/category.dart';
import 'package:my_finance_flutter/core/data_source/db/model/operation.dart';
import 'package:my_finance_flutter/core/data_source/db/model/user.dart';

part 'database_client.g.dart';

@UseMoor(tables: [UserTable, CategoryTable, AccountTable, OperationTable])
class DatabaseClient extends _$DatabaseClient {
  DatabaseClient()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;

  Future<List<AccountEntity>> get allTodoEntries => select(accountTable).get();
}
