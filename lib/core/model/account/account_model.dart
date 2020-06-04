import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
abstract class AccountModel implements _$AccountModel {
  const AccountModel._();

  const factory AccountModel({
    int id,
    int remoteId,
    bool deleted,
    String name,
    String type,
    ProfileModel profile,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
