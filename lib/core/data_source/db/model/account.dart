import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("AccountEntity")
class AccountTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  IntColumn get initialValue => integer().nullable()();
  TextColumn get currency => text()();
  IntColumn get user => integer()();
}
