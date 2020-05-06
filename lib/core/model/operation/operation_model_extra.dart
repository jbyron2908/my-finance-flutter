import 'package:intl/intl.dart';
import 'package:my_finance_flutter/core/data_source/storage/client/storage_client.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/util/date_util.dart';

extension OperationModelExtra on OperationModel {
  static OperationModel buildEmpty() => OperationModel(
        date: DateUtil.today(),
        type: StorageClient.instance.operationTypeDao.getLastUsed(),
        state: StorageClient.instance.operationStateDao.getLastUsed(),
      );

  OperationModel buildCopy() => OperationModel(
        id: null,
        remoteId: null,
        date: DateUtil.today(),
        deleted: deleted ?? deleted,
        title: title ?? title,
        value: value ?? value,
        type: type ?? type,
        state: state ?? state,
        description: description ?? description,
        payee: payee ?? payee,
        category: category ?? category,
        account: account ?? account,
        profile: profile ?? profile,
      );

  String getTypeString() {
    return (type == null) ? 'Unknown' : type.title;
  }

  String getStateString() {
    return (state == null) ? 'Unknown' : state.title;
  }

  String getDateString() {
    return date == null ? 'Unknown' : DateFormat('dd/MM/yyyy').format(date);
  }

  String getTimeString() {
    return date == null ? 'Unknown' : DateFormat('HH:mm').format(date);
  }

  String getAccountString() {
    return account == null ? 'Unknown' : account.name;
  }

  String getCategoryString() {
    return category == null ? 'Unknown' : category.name;
  }

  String getCategoryWithParent() {
    final parentName =
        category.parent == null ? 'Unknown' : category.parent.name;
    final categoryName = category.name;
    return '$parentName: $categoryName';
  }

  String getPayeeString() {
    return payee == null ? 'Unknown' : payee.name;
  }

  String getPayeeWithStatus() {
    final payeeName = payee.name;
    final stateTitle = state.title;
    return '$payeeName: $stateTitle';
  }

  String getValue() {
    final formarter = NumberFormat('00.00');
    return formarter.format(value);
  }

  String getValueWithCurrency() {
    var currency = profile.currency;
    var valueString = getValue();
    return '$currency $valueString';
  }
}
