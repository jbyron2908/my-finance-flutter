import 'package:moor/moor.dart';
import 'package:my_finance_flutter/core/data_source/database/base/base_table.dart';

@DataClassName('OperationEntity')
class OperationTable extends BaseTable {
  TextColumn get title => text()();
  RealColumn get value => real()();
  TextColumn get type => text()();
  TextColumn get date => text()();
  TextColumn get state => text()();
  TextColumn get description => text()();
  IntColumn get payee => integer()();
  IntColumn get category => integer()();
  IntColumn get account => integer()();
  IntColumn get profile => integer()();
}
