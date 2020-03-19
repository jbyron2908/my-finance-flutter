import 'dart:convert';

import 'package:my_finance_flutter/core/model/profile/model.dart';

class AccountModel {
  int id;
  int remoteId;
  String name;
  String type;
  double initialValue;
  ProfileModel profile;

  AccountModel({
    this.id,
    this.remoteId,
    this.name,
    this.type,
    this.initialValue,
    this.profile,
  });

  AccountModel copyWith({
    int id,
    int remoteId,
    String name,
    String type,
    double initialValue,
    ProfileModel profile,
  }) {
    return AccountModel(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      name: name ?? this.name,
      type: type ?? this.type,
      initialValue: initialValue ?? this.initialValue,
      profile: profile ?? this.profile,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'remoteId': remoteId,
      'name': name,
      'type': type,
      'initialValue': initialValue,
      'profile': profile.toMap(),
    };
  }

  static AccountModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AccountModel(
      id: map['id'],
      remoteId: map['remoteId'],
      name: map['name'],
      type: map['type'],
      initialValue: map['initialValue'],
      profile: ProfileModel.fromMap(map['profile']),
    );
  }

  String toJson() => json.encode(toMap());

  static AccountModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'AccountModel(id: $id, remoteId: $remoteId, name: $name, type: $type, initialValue: $initialValue, profile: $profile)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AccountModel &&
        o.id == id &&
        o.remoteId == remoteId &&
        o.name == name &&
        o.type == type &&
        o.initialValue == initialValue &&
        o.profile == profile;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        remoteId.hashCode ^
        name.hashCode ^
        type.hashCode ^
        initialValue.hashCode ^
        profile.hashCode;
  }
}
