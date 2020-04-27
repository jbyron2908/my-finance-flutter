import 'package:moor/moor.dart';

@DataClassName("AccountEntity")
class AccountTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();
  TextColumn get name => text()();
  TextColumn get type => text()();
  RealColumn get initialValue => real().withDefault(Constant(0))();
  IntColumn get profile => integer()();
}
