class UserClientTypeModel {
  const UserClientTypeModel({
    required this.id,
    required this.title,
  });

  final int? id;
  final String title;

  factory UserClientTypeModel.fromJson(Map<String, Object?> json) =>
      UserClientTypeModel(
        id: json['id'] as int?,
        title: json['title'] as String? ?? 'null',
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
      };

  @override
  bool operator ==(covariant UserClientTypeModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  UserClientTypeModel copyWith({
    int? id,
    String? title,
  }) =>
      UserClientTypeModel(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  @override
  String toString() => 'UserClientTypeModel(id: $id, title: $title)';
}
