import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_table.dart';

@DataClassName('CategoryEntity')
class CategoryTable extends BaseTable {
  TextColumn get name => text()();
  TextColumn get icon => text()();
  IntColumn get parent => integer().nullable()();
}
