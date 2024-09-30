class KbaseItemModel {
  const KbaseItemModel({
    required this.id,
    required this.isDefault,
    required this.title,
    required this.status,
    required this.type,
    required this.icon,
    required this.childAmount,
    required this.settings,
  });

  final int id;
  final int isDefault;
  final String? title;
  final int status;
  final int type;
  final String? icon;
  final int childAmount;
  final List<Settings> settings;

  factory KbaseItemModel.fromJson(Map<String, Object?> json) => KbaseItemModel(
        id: json['id'] as int,
        isDefault: json['is_default'] as int,
        title: json['title'] as String?,
        status: json['status'] as int,
        type: json['type'] as int,
        icon: json['icon'] as String?,
        childAmount: json['child_amount'] as int,
        settings: List<Settings>.from(
          (json['settings'] as List).map<Settings>(
            (x) => Settings.fromJson(x as Map<String, Object?>),
          ),
        ),
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'isDefault': isDefault,
        'title': title,
        'status': status,
        'type': type,
        'icon': icon,
        'childAmount': childAmount,
        'settings': settings.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() => 'KbaseItemModel('
      'id: $id,'
      'isDefault: $isDefault,'
      'title: $title,'
      'status: $status,'
      'type: $type,'
      'icon: $icon,'
      'childAmount: $childAmount,'
      'settings: $settings)';
}

class Settings {
  const Settings({
    required this.source,
    required this.defaultAccessType,
  });

  final String? source;
  final String? defaultAccessType;

  factory Settings.fromJson(Map<String, Object?> json) => Settings(
        source: json['source'] as String?,
        defaultAccessType: json['default_access_type'] as String?,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'source': source,
        'defaultAccessType': defaultAccessType,
      };

  @override
  String toString() => 'Settings('
      'source: $source,'
      'defaultAccessType: $defaultAccessType)';
}
