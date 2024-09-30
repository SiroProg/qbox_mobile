class ResponseQueryModel {
  const ResponseQueryModel({
    required this.id,
    required this.title,
    required this.response,
    required this.categoryId,
    required this.projectId,
    required this.extra,
  });

  final int id;
  final String title;
  final String response;
  final int categoryId;
  final int projectId;
  final Map<String, Object?> extra;

  factory ResponseQueryModel.fromJson(Map<String, Object?> json) =>
      ResponseQueryModel(
        id: json['id'] as int,
        title: json['title'] as String,
        response: json['response'] as String,
        categoryId: json['category_id'] as int,
        projectId: json['project_id'] as int,
        extra: Map<String, Object?>.from(
          (json['extra'] as Map<String, Object?>),
        ),
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'response': response,
        'categoryId': categoryId,
        'projectId': projectId,
        'extra': extra,
      };

  @override
  String toString() => 'ResponseQueryModel('
      'id: $id,'
      'title: $title,'
      'response: $response,'
      'categoryId: $categoryId,'
      'projectId: $projectId,'
      'extra: $extra)';
}
