import 'dart:convert';

class Repository {
  String name;
  DateTime createdAt;

  Repository(
    this.name,
    this.createdAt,
  );

  Repository copyWith({
    String name,
    DateTime createdAt,
  }) {
    return Repository(
      name ?? this.name,
      createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  static Repository fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Repository(
      map['name'],
      DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  static Repository fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Repository(name: $name, createdAt: $createdAt)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Repository && o.name == name && o.createdAt == createdAt;
  }

  @override
  int get hashCode => name.hashCode ^ createdAt.hashCode;
}
