import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_table.dart';

@DataClassName('LabelEntity')
class LabelTable extends BaseTable {
  TextColumn get name => text()();
}
