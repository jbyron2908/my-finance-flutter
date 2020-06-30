import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:my_finance_flutter/core/data_source/storage/client/storage_client.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/util/date_util.dart';

export 'operation_state_model.dart';
export 'operation_type_model.dart';

part 'operation_model.freezed.dart';
part 'operation_model.g.dart';

@freezed
abstract class OperationModel
    with DiagnosticableTreeMixin
    implements _$OperationModel {
  const OperationModel._();

  const factory OperationModel({
    int id,
    int remoteId,
    bool deleted,
    String title,
    @Default(0) double value,
    OperationTypeModel type,
    DateTime date,
    OperationStateModel state,
    String description,
    PayeeModel payee,
    CategoryModel category,
    AccountModel account,
    ProfileModel profile,
  }) = _OperationModel;

  factory OperationModel.fromJson(Map<String, dynamic> json) =>
      _$OperationModelFromJson(json);

  static OperationModel buildEmpty() => OperationModel(
        date: DateUtil.today(),
        type: StorageClient.instance.operationTypeDao.getLastUsed(),
        state: StorageClient.instance.operationStateDao.getLastUsed(),
      );

  OperationModel buildCopy() => copyWith(
        id: null,
        remoteId: null,
        date: DateUtil.today(),
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
    var currency = this.profile.currency;
    var valueString = getValue();
    return '$currency $valueString';
  }
}
