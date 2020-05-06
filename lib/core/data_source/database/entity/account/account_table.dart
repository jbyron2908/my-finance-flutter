import 'package:moor/moor.dart';

@DataClassName('AccountEntity')
class AccountTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();
  TextColumn get name => text()();
  TextColumn get type => text()();
  IntColumn get profile => integer()();
}
