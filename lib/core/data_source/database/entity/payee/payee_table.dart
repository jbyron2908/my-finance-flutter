import 'package:moor/moor.dart';

@DataClassName("PayeeEntity")
class PayeeTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();
  TextColumn get name => text()();
}
