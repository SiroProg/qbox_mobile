import 'package:flutter/foundation.dart';

class SkillGroupModel {
  const SkillGroupModel({
    required this.configs,
    required this.id,
    required this.level,
    required this.media,
    required this.status,
    required this.title,
    required this.topic,
  });

  final Map<String, Object?> configs;
  final int id;
  final int level;
  final String media;
  final int status;
  final String title;
  final String topic;

  factory SkillGroupModel.fromJson(Map<String, Object?> json) =>
      SkillGroupModel(
        configs: json['configs'] as Map<String, Object?>,
        id: json['id'] as int,
        level: json['level'] as int,
        media: json['media'] as String,
        status: json['status'] as int,
        title: json['title'] as String,
        topic: json['topic'] as String,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'configs': configs,
        'id': id,
        'level': level,
        'media': media,
        'status': status,
        'title': title,
        'topic': topic,
      };

  @override
  bool operator ==(covariant SkillGroupModel other) {
    if (identical(this, other)) return true;

    return mapEquals(other.configs, configs) &&
        other.id == id &&
        other.level == level &&
        other.media == media &&
        other.status == status &&
        other.title == title &&
        other.topic == topic;
  }

  @override
  int get hashCode =>
      configs.hashCode ^
      id.hashCode ^
      level.hashCode ^
      media.hashCode ^
      status.hashCode ^
      title.hashCode ^
      topic.hashCode;

  SkillGroupModel copyWith({
    Map<String, Object?>? configs,
    int? id,
    int? level,
    String? media,
    int? status,
    String? title,
    String? topic,
  }) =>
      SkillGroupModel(
        configs: configs ?? this.configs,
        id: id ?? this.id,
        level: level ?? this.level,
        media: media ?? this.media,
        status: status ?? this.status,
        title: title ?? this.title,
        topic: topic ?? this.topic,
      );

  @override
  String toString() => 'SkillGroup('
      'configs: $configs,'
      'id: $id,'
      'level: $level,'
      'media: $media,'
      'status: $status,'
      'title: $title,'
      'topic: $topic)';
}
