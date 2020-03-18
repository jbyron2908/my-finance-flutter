import 'dart:convert';

class ProfileModel {
  int id;
  int remoteId;
  String name;
  String currency;
  ProfileModel({
    this.id,
    this.remoteId,
    this.name,
    this.currency,
  });

  ProfileModel copyWith({
    int id,
    int remoteId,
    String name,
    String currency,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      name: name ?? this.name,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'remoteId': remoteId,
      'name': name,
      'currency': currency,
    };
  }

  static ProfileModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ProfileModel(
      id: map['id'],
      remoteId: map['remoteId'],
      name: map['name'],
      currency: map['currency'],
    );
  }

  String toJson() => json.encode(toMap());

  static ProfileModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProfileModel(id: $id, remoteId: $remoteId, name: $name, currency: $currency)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ProfileModel &&
        o.id == id &&
        o.remoteId == remoteId &&
        o.name == name &&
        o.currency == currency;
  }

  @override
  int get hashCode {
    return id.hashCode ^ remoteId.hashCode ^ name.hashCode ^ currency.hashCode;
  }
}
