import 'package:moor/moor.dart';

@DataClassName('TemplateOperationEntity')
class TemplateOperationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get remoteId => integer().nullable()();
  BoolColumn get deleted => boolean().withDefault(const Constant(false))();
  TextColumn get title => text()();
  RealColumn get value => real()();
  TextColumn get type => text()();
  TextColumn get state => text()();
  TextColumn get description => text()();
  IntColumn get payee => integer()();
  IntColumn get category => integer()();
}
