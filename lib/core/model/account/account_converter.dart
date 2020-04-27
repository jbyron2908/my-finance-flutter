import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/core/model/profile/index.dart';

class AccountConverter {
  static AccountEntity toEntity(AccountModel model) {
    return AccountEntity(
      id: model.id,
      remoteId: model.remoteId,
      deleted: model.deleted,
      name: model.name,
      type: model.type,
      initialValue: model.initialValue,
      profile: model.profile?.id,
    );
  }

  static AccountModel toModel(AccountEntity entity, {ProfileEntity profile}) {
    return AccountModel(
      id: entity.id,
      remoteId: entity.remoteId,
      deleted: entity.deleted,
      name: entity.name,
      type: entity.type,
      initialValue: entity.initialValue,
      profile: profile != null ? ProfileConverter.toModel(profile) : null,
    );
  }
}
