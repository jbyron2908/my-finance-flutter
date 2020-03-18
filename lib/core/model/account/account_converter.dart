import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_converter.dart';

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
    return AccountModel(
      id: entity.id,
      remoteId: entity.remoteId,
      name: entity.name,
      type: entity.type,
      initialValue: entity.initialValue,
      profile: profile != null ? ProfileConverter.toModel(profile) : null,
    );
  }
}
