class CardItemModel {
  const CardItemModel({
    required this.id,
    required this.title,
    required this.parentId,
    required this.key,
    required this.status,
    required this.details,
    required this.position,
    required this.childrenCount,
  });

  final int id;
  final String title;
  final int parentId;
  final String key;
  final int status;
  final Map<String, dynamic>? details;
  final int position;
  final int childrenCount;

  factory CardItemModel.fromJson(Map<String, Object?> json) => CardItemModel(
        id: json['id'] as int,
        title: json['title'] as String,
        parentId: json['parent_id'] as int,
        key: json['key'] as String,
        status: json['status'] as int,
        details: json['details'] != null
            ? Map<String, dynamic>.from(
                (json['details'] as Map<String, dynamic>),
              )
            : null,
        position: json['position'] as int,
        childrenCount: json['children_count'] as int,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'parentId': parentId,
        'key': key,
        'status': status,
        'details': details,
        'position': position,
        'childrenCount': childrenCount,
      };

  @override
  String toString() => 'CardItemModel('
      'id: $id,'
      'title: $title,'
      'parentId: $parentId,'
      'key: $key,'
      'status: $status,'
      'details: $details,'
      'position: $position,'
      'childrenCount: $childrenCount)';
}
