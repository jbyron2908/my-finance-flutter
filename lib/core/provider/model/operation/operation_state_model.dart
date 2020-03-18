import 'dart:convert';

class OperationStateModel {
  String id;
  String title;

  OperationStateModel({
    this.id,
    this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  static OperationStateModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OperationStateModel(
      id: map['id'],
      title: map['title'],
    );
  }

  String toJson() => json.encode(toMap());

  static OperationStateModel fromJson(String source) =>
      fromMap(json.decode(source));

  OperationStateModel copyWith({
    String id,
    String title,
  }) {
    return OperationStateModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  String toString() => 'OperationStateModel(id: $id, title: $title)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is OperationStateModel && o.id == id && o.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}
