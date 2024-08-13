class UserTreatmentTypeModel {
  const UserTreatmentTypeModel({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory UserTreatmentTypeModel.fromJson(Map<String, Object?> json) =>
      UserTreatmentTypeModel(
        id: json['id'] as int,
        title: json['title'] as String,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
      };

  @override
  bool operator ==(covariant UserTreatmentTypeModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  UserTreatmentTypeModel copyWith({
    int? id,
    String? title,
  }) =>
      UserTreatmentTypeModel(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  @override
  String toString() => 'UserTreatmentTypeModel(id: $id, title: $title)';
}
