import 'package:hive/hive.dart';

part 'operation_type_entity.g.dart';

@HiveType(typeId: 1)
class OperationTypeEntity {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;
}
