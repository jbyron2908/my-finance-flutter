import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/profile/index.dart';

class ProfileConverter {
  static ProfileEntity toEntity(ProfileModel model) {
    return ProfileEntity(
      id: model.id,
      remoteId: model.remoteId,
      deleted: model.deleted,
      name: model.name,
      currency: model.currency,
    );
  }

  static ProfileModel toModel(ProfileEntity entity) {
    return ProfileModel(
      id: entity.id,
      remoteId: entity.remoteId,
      deleted: entity.deleted,
      name: entity.name,
      currency: entity.currency,
    );
  }
}
