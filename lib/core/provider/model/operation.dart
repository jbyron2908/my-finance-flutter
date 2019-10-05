import 'package:json_annotation/json_annotation.dart';

part 'operation.g.dart';

@JsonSerializable()
class OperationModel {
  int id;
  int remoteId;
  String title;
  double value;
  String type;
  String date;
  String state;
  String description;
  int category;
  int account;

  OperationModel();

  factory OperationModel.fromJson(Map<String, dynamic> json) =>
      _$OperationModelFromJson(json);

  Map<String, dynamic> toJson() => _$OperationModelToJson(this);
}
