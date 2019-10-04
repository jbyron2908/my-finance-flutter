import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("CategoryEntity")
class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get name => text()();
  IntColumn get category => integer().nullable()();
  IntColumn get user => integer()();
}
