import 'dart:convert';

class OperationTypeModel {
  final String id;
  final String title;

  OperationTypeModel({
    this.id,
    this.title,
  });

  OperationTypeModel copyWith({
    String id,
    String title,
  }) {
    return OperationTypeModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  static OperationTypeModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OperationTypeModel(
      id: map['id'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  static OperationTypeModel fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() => 'OperationTypeModel(id: $id, title: $title)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is OperationTypeModel && o.id == id && o.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
