import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';

part 'payee_model.g.dart';

@JsonSerializable()
class PayeeModel {
  int id;
  int remoteId;
  String name;

  PayeeModel();

  factory PayeeModel.fromJson(Map<String, dynamic> json) =>
      _$PayeeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PayeeModelToJson(this);
}

class PayeeConverter {
  static PayeeEntity toEntity(PayeeModel model) {
    return PayeeEntity(
      id: model.id,
      name: model.name,
      remoteId: model.remoteId,
    );
  }

  static PayeeModel toModel(PayeeEntity entity) {
    return PayeeModel()
      ..id = entity.id
      ..name = entity.name
      ..remoteId = entity.remoteId;
  }
}
