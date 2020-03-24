import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';

class PayeeConverter {
  static PayeeEntity toEntity(PayeeModel model) {
    return PayeeEntity(
      id: model.id,
      name: model.name,
      remoteId: model.remoteId,
    );
  }

  static PayeeModel toModel(PayeeEntity entity) {
    return PayeeModel(
      id: entity.id,
      name: entity.name,
      remoteId: entity.remoteId,
    );
  }
}
