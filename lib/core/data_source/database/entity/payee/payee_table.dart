import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_table.dart';

@DataClassName('PayeeEntity')
class PayeeTable extends BaseTable {
  TextColumn get name => text()();
}
