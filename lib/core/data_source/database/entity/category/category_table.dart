import 'package:moor/moor.dart';

@DataClassName("CategoryEntity")
class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get name => text()();
  IntColumn get parent => integer().nullable()();
}
