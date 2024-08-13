class UserPostMistakeModel {
  const UserPostMistakeModel({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory UserPostMistakeModel.fromJson(Map<String, Object?> json) =>
      UserPostMistakeModel(
        id: json['id'] as int,
        title: json['title'] as String,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
      };

  @override
  bool operator ==(covariant UserPostMistakeModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  UserPostMistakeModel copyWith({
    int? id,
    String? title,
  }) =>
      UserPostMistakeModel(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  @override
  String toString() => 'UserPostMistakeModel(id: $id, title: $title)';
}
