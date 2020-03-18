import 'dart:convert';

class PayeeModel {
  int id;
  int remoteId;
  String name;
  PayeeModel({
    this.id,
    this.remoteId,
    this.name,
  });

  PayeeModel copyWith({
    int id,
    int remoteId,
    String name,
  }) {
    return PayeeModel(
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

  static PayeeModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PayeeModel(
      id: map['id'],
      remoteId: map['remoteId'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static PayeeModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'PayeeModel(id: $id, remoteId: $remoteId, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PayeeModel &&
        o.id == id &&
        o.remoteId == remoteId &&
        o.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ remoteId.hashCode ^ name.hashCode;
}
