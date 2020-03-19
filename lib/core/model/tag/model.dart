import 'dart:convert';

class TagModel {
  int id;
  int remoteId;
  String name;

  TagModel({
    this.id,
    this.remoteId,
    this.name,
  });

  TagModel copyWith({
    int id,
    int remoteId,
    String name,
  }) {
    return TagModel(
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

  static TagModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TagModel(
      id: map['id'],
      remoteId: map['remoteId'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static TagModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'TagModel(id: $id, remoteId: $remoteId, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TagModel &&
        o.id == id &&
        o.remoteId == remoteId &&
        o.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ remoteId.hashCode ^ name.hashCode;
}
