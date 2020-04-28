import 'package:intl/intl.dart';
import 'package:my_finance_flutter/core/data_source/storage/client/storage_client.dart';
import 'package:my_finance_flutter/core/model/operation/index.dart';
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
        deleted: deleted ?? this.deleted,
        title: title ?? this.title,
        value: value ?? this.value,
        type: type ?? this.type,
        state: state ?? this.state,
        description: description ?? this.description,
        payee: payee ?? this.payee,
        category: category ?? this.category,
        account: account ?? this.account,
        profile: profile ?? this.profile,
      );

  String getTypeString() {
    return (type == null) ? "Unknown" : type.title;
  }

  String getStateString() {
    return (state == null) ? "Unknown" : state.title;
  }

  String getDateString() {
    return date == null ? "Unknown" : DateFormat("dd/MM/yyyy").format(date);
  }

  String getTimeString() {
    return date == null ? "Unknown" : DateFormat("HH:mm").format(date);
  }

  String getAccountString() {
    return account == null ? "Unknown" : account.name;
  }

  String getCategoryString() {
    return category == null ? "Unknown" : category.name;
  }

  String getCategoryWithParent() {
    final parentName =
        category.parent == null ? "Unknown" : category.parent.name;
    final categoryName = category.name;
    return "$parentName: $categoryName";
  }

  String getPayeeString() {
    return payee == null ? "Unknown" : payee.name;
  }

  String getPayeeWithStatus() {
    final payeeName = payee.name;
    final stateTitle = state.title;
    return "$payeeName: $stateTitle";
  }

  String getValue() {
    if (value != null) {}
    return value.toStringAsFixed(2);
  }

  String getValueWithCurrency() {
    String currency = profile.currency;
    String valueString = value.toStringAsFixed(2);
    return "$currency $valueString";
  }
}
