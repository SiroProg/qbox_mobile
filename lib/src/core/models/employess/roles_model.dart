import 'config_model.dart';

class RolesModel {
  const RolesModel({
    required this.id,
    required this.title,
    required this.status,
    required this.configs,
  });

  final int id;
  final String title;
  final int status;
  final ConfigModel configs;

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'status': status,
        'configs': configs.toJson(),
      };

  factory RolesModel.fromJson(Map<String, Object?> json) => RolesModel(
        id: json['id'] as int,
        title: json['title'] as String,
        status: json['status'] as int,
        configs: ConfigModel.fromJson(
          json['configs'] as Map<String, Object?>,
        ),
      );

  @override
  bool operator ==(covariant RolesModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.status == status &&
        other.configs == configs;
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ status.hashCode ^ configs.hashCode;

  RolesModel copyWith({
    int? id,
    String? title,
    int? status,
    ConfigModel? configs,
  }) =>
      RolesModel(
        id: id ?? this.id,
        title: title ?? this.title,
        status: status ?? this.status,
        configs: configs ?? this.configs,
      );

  @override
  String toString() => 'RolesModel('
      'id: $id,'
      'title: $title,'
      'status: $status,'
      'configs: $configs)';
}
