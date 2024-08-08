class LocaleEmployee {
  final int id;
  final String language;
  final String region;
  final String title;
  final String? description;
  final int priority;

  LocaleEmployee({
    required this.id,
    required this.language,
    required this.region,
    required this.title,
    this.description,
    required this.priority,
  });

  factory LocaleEmployee.fromJson(Map<String, dynamic> json) {
    return LocaleEmployee(
      id: json['id'] as int? ?? 0,
      language: json['language'] as String? ?? "",
      region: json['region'] as String? ?? "",
      title: json['title'] as String? ?? "",
      description: json['description'] as String?,
      priority: json['priority'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'language': language,
      'region': region,
      'title': title,
      'description': description,
      'priority': priority,
    };
  }

  @override
  String toString() {
    return 'Locale{id: $id, language: $language, region: $region, title: $title, '
        'description: $description, priority: $priority}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LocaleEmployee &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              language == other.language &&
              region == other.region &&
              title == other.title &&
              description == other.description &&
              priority == other.priority;

  @override
  int get hashCode =>
      id.hashCode ^
      language.hashCode ^
      region.hashCode ^
      title.hashCode ^
      description.hashCode ^
      priority.hashCode;
}