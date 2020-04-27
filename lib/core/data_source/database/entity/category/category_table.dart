import 'package:moor/moor.dart';

@DataClassName("CategoryEntity")
class CategoryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();
  TextColumn get name => text()();
  IntColumn get parent => integer().nullable()();
}
