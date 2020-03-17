import 'package:json_annotation/json_annotation.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/core/provider/model/operation_type_model.dart';
import 'package:my_finance_flutter/core/provider/model/profile_model.dart';
import 'package:my_finance_flutter/core/util/date_util.dart';

part 'operation_model.g.dart';

@JsonSerializable()
class OperationModel {
  int id;
  int remoteId;
  String title;
  double value;
  OperationTypeModel type;
  DateTime date;
  String state;
  String description;
  CategoryModel category;
  AccountModel account;
  ProfileModel profile;

  OperationModel({
    this.id,
    this.remoteId,
    this.title,
    this.value,
    this.type,
    this.date,
    this.state,
    this.description,
  });

  OperationModel.empty() {
    this.date = DateUtil.today();
    this.type = OperationTypeConstants.getDefault();
  }

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
    return OperationModel()
      ..id = entity.id
      ..title = entity.title
      ..value = entity.value
      ..type = OperationTypeConstants.getById(entity.type)
      ..date = DateTime.parse(entity.date)
      ..state = entity.state
      ..description = entity.description
      ..category = category != null ? CategoryConverter.toModel(category) : null
      ..account = account != null ? AccountConverter.toModel(account) : null
      ..profile = profile != null ? ProfileConverter.toModel(profile) : null
      ..remoteId = entity.remoteId;
  }
}
