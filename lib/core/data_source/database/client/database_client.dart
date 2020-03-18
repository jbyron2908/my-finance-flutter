import 'package:moor_flutter/moor_flutter.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/account_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/account_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/category_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/category_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/operation/operation_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/operation/operation_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/payee_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/profile_table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/tag/tag_dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/tag/tag_table.dart';
import 'package:provider/provider.dart';

part 'database_client.g.dart';

@UseMoor(
  tables: [
    ProfileTable,
    AccountTable,
    CategoryTable,
    OperationTable,
    PayeeTable,
    TagTable,
  ],
  daos: [
    ProfileDao,
    AccountDao,
    CategoryDao,
    OperationDao,
    PayeeDao,
    TagDao,
  ],
)
class DatabaseClient extends _$DatabaseClient {
  static SingleChildCloneableWidget buildProvider() =>
      Provider.value(value: DatabaseClient());

  DatabaseClient()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite'));

  @override
  int get schemaVersion => 1;
}
