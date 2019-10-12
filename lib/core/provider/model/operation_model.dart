import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';

part 'operation_model.g.dart';

@JsonSerializable()
class OperationModel {
  int id;
  int remoteId;
  String title;
  double value;
  String type;
  String date;
  String state;
  String description;
  CategoryModel category;
  AccountModel account;

  OperationModel();

  factory OperationModel.fromJson(Map<String, dynamic> json) =>
      _$OperationModelFromJson(json);

  Map<String, dynamic> toJson() => _$OperationModelToJson(this);
}

class OperationConverter {
  static OperationEntity toEntity(OperationModel model) {
    return OperationEntity(
      id: model.id,
      title: model.title,
      value: model.value,
      type: model.type,
      date: model.date,
      state: model.state,
      description: model.description,
      category: model.category?.id,
      account: model.account?.id,
      remoteId: model.remoteId,
    );
  }

  static OperationModel toModel(OperationEntity entity,
      {CategoryEntity category, AccountEntity account}) {
    return OperationModel()
      ..id = entity.id
      ..title = entity.title
      ..value = entity.value
      ..type = entity.type
      ..date = entity.date
      ..state = entity.state
      ..description = entity.description
      ..category = category != null ? CategoryConverter.toModel(category) : null
      ..account = account != null ? AccountConverter.toModel(account) : null
      ..remoteId = entity.remoteId;
  }
}
