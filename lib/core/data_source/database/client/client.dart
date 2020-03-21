import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/account/table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/category/table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/label/dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/label/table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/operation/dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/operation/table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/payee/table.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/dao.dart';
import 'package:my_finance_flutter/core/data_source/database/entity/profile/table.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

part 'client.g.dart';

@UseMoor(
  tables: [
    ProfileTable,
    AccountTable,
    CategoryTable,
    OperationTable,
    PayeeTable,
    LabelTable,
  ],
  daos: [
    ProfileDao,
    AccountDao,
    CategoryDao,
    OperationDao,
    PayeeDao,
    LabelDao,
  ],
)
class DatabaseClient extends _$DatabaseClient {
  static SingleChildWidget buildProvider() =>
      Provider.value(value: DatabaseClient());

  static DatabaseClient of(BuildContext context) =>
      Provider.of<DatabaseClient>(context, listen: false);

  DatabaseClient() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await path_provider.getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}
