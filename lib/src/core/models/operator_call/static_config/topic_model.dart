import 'package:flutter/foundation.dart';

class TopicModel {
  const TopicModel({
    required this.title,
    required this.topic,
  });

  final Map<String, String>? title;
  final String topic;

  factory TopicModel.fromJson(Map<String, Object?> json) => TopicModel(
        title: Map<String, String>.from(json['title'] as Map<String, String>),
        topic: json['topic'] as String? ?? 'null',
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'title': title,
        'topic': topic,
      };

  @override
  bool operator ==(covariant TopicModel other) {
    if (identical(this, other)) return true;

    return mapEquals(other.title, title) && other.topic == topic;
  }

  @override
  int get hashCode => title.hashCode ^ topic.hashCode;

  TopicModel copyWith({
    Map<String, String>? title,
    String? topic,
  }) =>
      TopicModel(
        title: title ?? this.title,
        topic: topic ?? this.topic,
      );

  @override
  String toString() => 'Topic(title: $title, topic: $topic)';
}
