import 'dart:convert';

import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';

class CategoryModel {
  int id;
  int remoteId;
  String name;
  CategoryModel parent;

  CategoryModel({
    this.id,
    this.remoteId,
    this.name,
    this.parent,
  });

  CategoryModel copyWith({
    int id,
    int remoteId,
    String name,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'remoteId': remoteId,
      'name': name,
    };
  }

  static CategoryModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoryModel(
      id: map['id'],
      remoteId: map['remoteId'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static CategoryModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'CategoryModel(id: $id, remoteId: $remoteId, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CategoryModel &&
        o.id == id &&
        o.remoteId == remoteId &&
        o.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ remoteId.hashCode ^ name.hashCode;
}

class CategoryConverter {
  static CategoryEntity toEntity(CategoryModel model) {
    return CategoryEntity(
      id: model.id,
      name: model.name,
      parent: model?.parent?.id,
      remoteId: model.remoteId,
    );
  }

  static CategoryModel toModel(CategoryEntity entity, {CategoryEntity parent}) {
    return CategoryModel(
      id: entity.id,
      remoteId: entity.remoteId,
      name: entity.name,
      parent: parent != null ? toModel(parent) : null,
    );
  }
}
