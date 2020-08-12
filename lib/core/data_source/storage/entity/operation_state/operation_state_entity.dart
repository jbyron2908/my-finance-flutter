import 'package:hive/hive.dart';

part 'operation_state_entity.g.dart';

@HiveType(typeId: 2)
class OperationStateEntity {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;
}
