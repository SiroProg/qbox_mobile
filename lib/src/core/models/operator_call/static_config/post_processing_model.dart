class PostProcessingModel {
  const PostProcessingModel({required this.formId});

  final int? formId;

  factory PostProcessingModel.fromJson(Map<String, Object?> json) =>
      PostProcessingModel(formId: json['form_id'] as int?);

  Map<String, Object?> toJson() => <String, Object?>{'form_id': formId};

  @override
  bool operator ==(covariant PostProcessingModel other) {
    if (identical(this, other)) return true;

    return other.formId == formId;
  }

  @override
  int get hashCode => formId.hashCode;

  PostProcessingModel copyWith({
    int? formId,
  }) =>
      PostProcessingModel(
        formId: formId ?? this.formId,
      );

  @override
  String toString() => 'PostProcessingModel(formId: $formId)';
}
