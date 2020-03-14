import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  int id;
  int remoteId;
  String name;
  String currency;

  ProfileModel();

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

class ProfileConverter {
  static ProfileEntity toEntity(ProfileModel model) {
    return ProfileEntity(
        id: model.id,
        name: model.name,
        remoteId: model.remoteId,
        currency: model.currency);
  }

  static ProfileModel toModel(ProfileEntity entity) {
    return ProfileModel()
      ..id = entity.id
      ..name = entity.name
      ..remoteId = entity.remoteId
      ..currency = entity.currency;
  }
}
