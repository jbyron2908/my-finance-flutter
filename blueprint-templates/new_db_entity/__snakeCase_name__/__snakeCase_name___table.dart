import 'package:moor_flutter/moor_flutter.dart';

@DataClassName("{{pascalCase name}}Entity")
class {{pascalCase name}}Table extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  TextColumn get name => text()();
}
