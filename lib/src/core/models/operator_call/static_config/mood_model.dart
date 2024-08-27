class MoodModel {
  const MoodModel({
    required this.id,
    required this.status,
    required this.title,
  });

  final int? id;
  final int? status;
  final String title;

  factory MoodModel.fromJson(Map<String, Object?> json) => MoodModel(
        id: json['id'] as int?,
        status: json['status'] as int?,
        title: json['title'] as String? ?? 'null',
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'status': status,
        'title': title,
      };

  @override
  bool operator ==(covariant MoodModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.status == status && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ status.hashCode ^ title.hashCode;

  MoodModel copyWith({
    int? id,
    int? status,
    String? title,
  }) =>
      MoodModel(
        id: id ?? this.id,
        status: status ?? this.status,
        title: title ?? this.title,
      );

  @override
  String toString() => 'MoodModel(id: $id, status: $status, title: $title)';
}
