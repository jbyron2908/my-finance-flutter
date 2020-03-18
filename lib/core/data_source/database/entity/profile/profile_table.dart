import 'package:moor/moor.dart';

@DataClassName("ProfileEntity")
class ProfileTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get name => text()();
  TextColumn get currency => text()();
}
