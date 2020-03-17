import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'operation_type_model.g.dart';

@JsonSerializable()
class OperationTypeModel {
  final String id;
  final String title;

  OperationTypeModel({
    @required this.id,
    @required this.title,
  });

  factory OperationTypeModel.fromJson(Map<String, dynamic> json) =>
      _$OperationTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$OperationTypeModelToJson(this);
}
