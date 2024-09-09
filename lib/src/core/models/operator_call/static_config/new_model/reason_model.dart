class ReasonModel {
  ReasonModel({
    required this.id,
    required this.title,
    required this.description,
    required this.parentId,
    required this.childrenCount,
    this.children,
  });

  final int id;
  final String title;
  final String? description;
  final int? parentId;
  final int childrenCount;
  List<ReasonModel>? children;

  factory ReasonModel.fromJson(Map<String, Object?> json) => ReasonModel(
        id: json['id'] as int,
        title: json['title'] as String? ?? 'null',
        description: null,
        parentId: json['parent_id'] as int?,
        childrenCount: json['children_count'] as int,
      );

  static List<ReasonModel> sortReasons(List<ReasonModel> reasons) {
    final Map<int, ReasonModel> reasonMap = {
      for (ReasonModel reason in reasons) reason.id: reason
    };

    for (ReasonModel reason in reasons) {
      if (reason.parentId != null && reasonMap.containsKey(reason.parentId)) {
        final parent = reasonMap[reason.parentId];
        parent?.children = parent.children ?? [];

        if (!parent!.children!.any((child) => child.id == reason.id)) {
          parent.children!.add(reason);
        }
      }
    }

    return reasons.where((reason) => reason.parentId == null).toList();
  }

  @override
  String toString() => 'ReasonModel('
      'id: $id,'
      'title: $title,'
      'description: $description,'
      'parentId: $parentId,'
      'childrenCount: $childrenCount,'
      'children: $children)';
}
