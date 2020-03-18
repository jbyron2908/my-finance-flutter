import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';

class ProfileConverter {
  static ProfileEntity toEntity(ProfileModel model) {
    return ProfileEntity(
        id: model.id,
        name: model.name,
        remoteId: model.remoteId,
        currency: model.currency);
  }

  static ProfileModel toModel(ProfileEntity entity) {
    return ProfileModel(
      id: entity.id,
      name: entity.name,
      remoteId: entity.remoteId,
      currency: entity.currency,
    );
  }
}
