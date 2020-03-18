import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:my_finance_flutter/core/provider/constants/operation_state/operation_state_constants.dart';
import 'package:my_finance_flutter/core/provider/constants/operation_type/operation_type_constants.dart';
import 'package:my_finance_flutter/core/provider/model/account/account_model.dart';
import 'package:my_finance_flutter/core/provider/model/category/category_model.dart';
import 'package:my_finance_flutter/core/provider/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/provider/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/provider/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/util/date_util.dart';

class OperationModel {
  int id;
  int remoteId;
  String title;
  double value;
  OperationTypeModel type;
  DateTime date;
  OperationStateModel state;
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
    this.category,
    this.account,
    this.profile,
  });

  OperationModel.empty() {
    this.date = DateUtil.today();
    this.type = OperationTypeConstants.getDefault();
    this.state = OperationStateConstants.getDefault();
  }

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

  OperationModel copyWith({
    int id,
    int remoteId,
    String title,
    double value,
    OperationTypeModel type,
    DateTime date,
    OperationStateModel state,
    String description,
    CategoryModel category,
    AccountModel account,
    ProfileModel profile,
  }) {
    return OperationModel(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      title: title ?? this.title,
      value: value ?? this.value,
      type: type ?? this.type,
      date: date ?? this.date,
      state: state ?? this.state,
      description: description ?? this.description,
      category: category ?? this.category,
      account: account ?? this.account,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'remoteId': remoteId,
      'title': title,
      'value': value,
      'type': type.toMap(),
      'date': date.millisecondsSinceEpoch,
      'state': state.toMap(),
      'description': description,
      'category': category.toMap(),
      'account': account.toMap(),
      'profile': profile.toMap(),
    };
  }

  static OperationModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OperationModel(
      id: map['id'],
      remoteId: map['remoteId'],
      title: map['title'],
      value: map['value'],
      type: OperationTypeModel.fromMap(map['type']),
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      state: OperationStateModel.fromMap(map['state']),
      description: map['description'],
      category: CategoryModel.fromMap(map['category']),
      account: AccountModel.fromMap(map['account']),
      profile: ProfileModel.fromMap(map['profile']),
    );
  }

  String toJson() => json.encode(toMap());

  static OperationModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'OperationModel(id: $id, remoteId: $remoteId, title: $title, value: $value, type: $type, date: $date, state: $state, description: $description, category: $category, account: $account, profile: $profile)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is OperationModel &&
        o.id == id &&
        o.remoteId == remoteId &&
        o.title == title &&
        o.value == value &&
        o.type == type &&
        o.date == date &&
        o.state == state &&
        o.description == description &&
        o.category == category &&
        o.account == account &&
        o.profile == profile;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        remoteId.hashCode ^
        title.hashCode ^
        value.hashCode ^
        type.hashCode ^
        date.hashCode ^
        state.hashCode ^
        description.hashCode ^
        category.hashCode ^
        account.hashCode ^
        profile.hashCode;
  }
}
