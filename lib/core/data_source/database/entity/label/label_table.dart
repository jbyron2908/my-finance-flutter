import 'package:moor/moor.dart';

@DataClassName("LabelEntity")
class LabelTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get name => text()();
}
