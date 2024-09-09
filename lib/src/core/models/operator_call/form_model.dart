class FormModel {
  const FormModel({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory FormModel.fromJson(Map<String, Object?> json) => FormModel(
        id: json['id'] as int,
        title: json['title'] as String,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
      };

  @override
  String toString() => 'FormModel(id: $id, title: $title)';
}
