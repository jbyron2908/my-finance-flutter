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

  String getPayeeString() {
    return payee == null ? "Unknown" : payee.name;
  }
}
