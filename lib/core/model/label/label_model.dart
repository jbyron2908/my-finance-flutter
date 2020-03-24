import 'dart:convert';

class LabelModel {
  int id;
  int remoteId;
  String name;

  LabelModel({
    this.id,
    this.remoteId,
    this.name,
  });

  LabelModel copyWith({
    int id,
    int remoteId,
    String name,
  }) {
    return LabelModel(
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

  static LabelModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LabelModel(
      id: map['id'],
      remoteId: map['remoteId'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static LabelModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'LabelModel(id: $id, remoteId: $remoteId, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LabelModel &&
        o.id == id &&
        o.remoteId == remoteId &&
        o.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ remoteId.hashCode ^ name.hashCode;
}
