import 'package:my_finance_flutter/core/constants/operation_state/operation_state_constants.dart';
import 'package:my_finance_flutter/core/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/account/account_converter.dart';
import 'package:my_finance_flutter/core/model/category/category_converter.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_converter.dart';
import 'package:my_finance_flutter/core/model/profile/profile_converter.dart';

class OperationConverter {
  static OperationEntity toEntity(OperationModel model) {
    return OperationEntity(
      id: model.id,
      remoteId: model.remoteId,
      deleted: model.deleted,
      title: model.title,
      value: model.value,
      type: model.type.id,
      date: model.date.toIso8601String(),
      state: model.state.id,
      description: model.description,
      payee: model.payee?.id,
      category: model.category?.id,
      account: model.account?.id,
      profile: model.profile?.id,
    );
  }

  static OperationModel toModel(
    OperationEntity entity, {
    PayeeEntity payee,
    CategoryEntity category,
    CategoryEntity parentCategory,
    AccountEntity account,
    ProfileEntity profile,
  }) {
    return OperationModel(
      id: entity.id,
      remoteId: entity.remoteId,
      deleted: entity.deleted,
      title: entity.title,
      value: entity.value,
      type: OperationTypeConstants.getById(entity.type),
      date: DateTime.parse(entity.date),
      state: OperationStateConstants.getById(entity.state),
      description: entity.description,
      payee: payee != null ? PayeeConverter.toModel(payee) : null,
      category: category != null
          ? CategoryConverter.toModel(category, parent: parentCategory)
          : null,
      account: account != null ? AccountConverter.toModel(account) : null,
      profile: profile != null ? ProfileConverter.toModel(profile) : null,
    );
  }
}
