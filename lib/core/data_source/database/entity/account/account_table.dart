import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_table.dart';

@DataClassName('AccountEntity')
class AccountTable extends BaseTable {
  TextColumn get name => text()();
  TextColumn get type => text()();
  IntColumn get profile => integer()();
}
