import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("AccountEntity")
class AccountTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  RealColumn get initialValue => real().withDefault(Constant(0))();
  TextColumn get currency => text()();
}
