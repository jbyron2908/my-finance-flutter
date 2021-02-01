import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_table.dart';

@DataClassName('ProfileEntity')
class ProfileTable extends BaseTable {
  TextColumn get name => text()();
  TextColumn get currency => text()();
}
