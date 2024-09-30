class Project {
  const Project({
    required this.id,
    required this.support,
  });

  final int? id;
  final String? support;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json['id'],
        support: json['support'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'support': support,
      };

  @override
  String toString() => 'Project(id: $id, support: $support)';
}
