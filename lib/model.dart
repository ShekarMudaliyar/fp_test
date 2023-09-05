import 'dart:convert';

class Model {
  late int id;
  late String name;
  late String tag;
  late String color;
  List criteria;
  Model({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  Model copyWith({
    int? id,
    String? name,
    String? tag,
    String? color,
    List? criteria,
  }) {
    return Model(
      id: id ?? this.id,
      name: name ?? this.name,
      tag: tag ?? this.tag,
      color: color ?? this.color,
      criteria: criteria ?? this.criteria,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'tag': tag,
      'color': color,
      'criteria': criteria,
    };
  }

  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
      id: map['id'],
      name: map['name'],
      tag: map['tag'],
      color: map['color'],
      criteria: map['criteria'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Model.fromJson(source) => Model.fromMap(source);

  @override
  String toString() {
    return 'Model(id: $id, name: $name, tag: $tag, color: $color, criteria: $criteria)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Model &&
        other.id == id &&
        other.name == name &&
        other.tag == tag &&
        other.color == color &&
        other.criteria == criteria;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        tag.hashCode ^
        color.hashCode ^
        criteria.hashCode;
  }
}
