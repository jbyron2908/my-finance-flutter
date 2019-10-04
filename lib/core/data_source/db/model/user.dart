import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("UserEntity")
class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get name => text()();
}
