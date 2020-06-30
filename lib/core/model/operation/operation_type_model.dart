import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_type_model.freezed.dart';
part 'operation_type_model.g.dart';

@freezed
abstract class OperationTypeModel implements _$OperationTypeModel {
  factory OperationTypeModel({
    String id,
    String title,
  }) = _OperationTypeModel;

  factory OperationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$OperationTypeModelFromJson(json);
}
