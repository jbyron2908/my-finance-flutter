import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  int id;
  int remoteId;
  String name;
  String type;
  double initialValue;
  String currency;

  AccountModel();

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}

class AccountConverter {
  static AccountEntity toEntity(AccountModel model) {
    return AccountEntity(
      id: model.id,
      name: model.name,
      currency: model.currency,
      type: model.type,
      initialValue: model.initialValue,
      remoteId: model.remoteId,
    );
  }

  static AccountModel toModel(AccountEntity entity) {
    return AccountModel()
      ..id = entity.id
      ..name = entity.name
      ..currency = entity.currency
      ..type = entity.type
      ..initialValue = entity.initialValue
      ..remoteId = entity.remoteId;
  }
}
