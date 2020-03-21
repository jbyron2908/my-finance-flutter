import 'package:my_finance_flutter/core/constants/operation_state/constants.dart';
import 'package:my_finance_flutter/core/constants/operation_type/constants.dart';
import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/model/account/converter.dart';
import 'package:my_finance_flutter/core/model/category/model.dart';
import 'package:my_finance_flutter/core/model/payee/converter.dart';
import 'package:my_finance_flutter/core/model/profile/converter.dart';

import 'model.dart';

class OperationConverter {
  static OperationEntity toEntity(OperationModel model) {
    return OperationEntity(
      id: model.id,
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
      remoteId: model.remoteId,
    );
  }

  static OperationModel toModel(
    OperationEntity entity, {
    PayeeEntity payee,
    CategoryEntity category,
    AccountEntity account,
    ProfileEntity profile,
  }) {
    return OperationModel(
      id: entity.id,
      remoteId: entity.remoteId,
      title: entity.title,
      value: entity.value,
      type: OperationTypeConstants.getById(entity.type),
      date: DateTime.parse(entity.date),
      state: OperationStateConstants.getById(entity.state),
      description: entity.description,
      payee: payee != null ? PayeeConverter.toModel(payee) : null,
      category: category != null ? CategoryConverter.toModel(category) : null,
      account: account != null ? AccountConverter.toModel(account) : null,
      profile: profile != null ? ProfileConverter.toModel(profile) : null,
    );
  }
}
