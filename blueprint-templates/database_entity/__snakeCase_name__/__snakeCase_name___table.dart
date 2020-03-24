import 'package:moor/moor.dart';

@DataClassName("{{pascalCase name}}Entity")
class {{pascalCase name}}Table extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get name => text()();
}
