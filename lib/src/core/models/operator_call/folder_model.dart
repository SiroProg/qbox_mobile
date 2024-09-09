import 'form_model.dart';

class FolderModel {
  const FolderModel({
    required this.id,
    required this.title,
    this.description,
    this.ordering,
    required this.status,
    required this.parentId,
    this.key,
    required this.details,
    required this.forms,
  });

  final int id;
  final String title;
  final String? description;
  final int? ordering;
  final int status;
  final int parentId;
  final String? key;
  final Map<String, Object?> details;
  final List<FormModel> forms;

  factory FolderModel.fromJson(Map<String, Object?> json) {
    final formsFromJson = json['forms'] as List;
    List<FormModel> formList =
        formsFromJson.map((form) => FormModel.fromJson(form)).toList();

    return FolderModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String?,
      ordering: json['ordering'] as int?,
      status: json['status'] as int,
      parentId: json['parent_id'] as int,
      key: json['key'] as String?,
      details: json['details'] as Map<String, Object?>? ?? {},
      forms: formList,
    );
  }

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'description': description,
        'ordering': ordering,
        'status': status,
        'parent_id': parentId,
        'key': key,
        'details': details,
        'forms': forms.map((form) => form.toJson()).toList(),
      };

  @override
  String toString() => 'FolderModel('
      'id: $id,'
      'title: $title,'
      'description: $description,'
      'ordering: $ordering,'
      'status: $status,'
      'parentId: $parentId,'
      'key: $key,'
      'details: $details,'
      'forms: $forms)';
}
