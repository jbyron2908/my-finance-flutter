import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';

class PayeeConverter {
  static PayeeEntity toEntity(PayeeModel model) {
    return PayeeEntity(
      id: model.id,
      remoteId: model.remoteId,
      deleted: model.deleted,
      name: model.name,
    );
  }

  static PayeeModel toModel(PayeeEntity entity) {
    return PayeeModel(
      id: entity.id,
      remoteId: entity.remoteId,
      deleted: entity.deleted,
      name: entity.name,
    );
  }
}
