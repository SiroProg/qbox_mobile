class Role {
  const Role({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
      };

  factory Role.fromJson(Map<String, Object?> json) => Role(
        id: json['id'] as int,
        title: json['title'] as String,
      );

  @override
  bool operator ==(covariant Role other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  Role copyWith({
    int? id,
    String? title,
  }) =>
      Role(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  @override
  String toString() => 'Role(id: $id, title: $title)';
}
