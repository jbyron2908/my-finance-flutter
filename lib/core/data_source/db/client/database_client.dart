import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/account/account_dao.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/account/account_table.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/category/category_dao.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/operation/operation_dao.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/operation/operation_table.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/payee/payee_dao.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/payee/payee_table.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/tag/tag_dao.dart';
import 'package:my_finance_flutter/core/data_source/db/entity/tag/tag_table.dart';

part 'database_client.g.dart';

@UseMoor(
  tables: [CategoryTable, AccountTable, OperationTable, PayeeTable, TagTable],
  daos: [CategoryDao, AccountDao, OperationDao, PayeeDao, TagDao],
)
class DatabaseClient extends _$DatabaseClient {
  DatabaseClient()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;
}
