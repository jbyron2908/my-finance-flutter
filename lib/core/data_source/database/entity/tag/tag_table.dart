import 'package:moor/moor.dart';

@DataClassName("TagEntity")
class TagTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get name => text()();
}
