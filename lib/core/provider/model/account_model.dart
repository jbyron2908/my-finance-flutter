import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/profile_model.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  int id;
  int remoteId;
  String name;
  String type;
  double initialValue;
  String currency;
  ProfileModel profile;

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
      type: model.type,
      initialValue: model.initialValue,
      remoteId: model.remoteId,
      profile: model.profile?.id,
    );
  }

  static AccountModel toModel(AccountEntity entity, {ProfileEntity profile}) {
    return AccountModel()
      ..id = entity.id
      ..name = entity.name
      ..type = entity.type
      ..initialValue = entity.initialValue
      ..remoteId = entity.remoteId
      ..profile = profile != null ? ProfileConverter.toModel(profile) : null;
  }
}
