import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/provider/model/account/account_converter.dart';
import 'package:my_finance_flutter/core/provider/model/category/category_model.dart';
import 'package:my_finance_flutter/core/provider/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/provider/model/profile/profile_converter.dart';

class OperationConverter {
  static OperationEntity toEntity(OperationModel model) {
    return OperationEntity(
      id: model.id,
      title: model.title,
      value: model.value,
      type: model.type.id,
      date: model.date.toIso8601String(),
      state: model.state,
      description: model.description,
      category: model.category?.id,
      account: model.account?.id,
      profile: model.profile?.id,
      remoteId: model.remoteId,
    );
  }

  static OperationModel toModel(OperationEntity entity,
      {CategoryEntity category, AccountEntity account, ProfileEntity profile}) {
    return OperationModel(
      id: entity.id,
      remoteId: entity.remoteId,
      title: entity.title,
      value: entity.value,
      type: OperationTypeConstants.getById(entity.type),
      date: DateTime.parse(entity.date),
      state: entity.state,
      description: entity.description,
      category: category != null ? CategoryConverter.toModel(category) : null,
      account: account != null ? AccountConverter.toModel(account) : null,
      profile: profile != null ? ProfileConverter.toModel(profile) : null,
    );
  }
}
