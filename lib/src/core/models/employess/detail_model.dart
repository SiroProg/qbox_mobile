import 'package:flutter/foundation.dart';

class Detail {
  const Detail({
    this.regionId,
    this.isLimitByGeo,
    this.topic,
  });

  final String? regionId;
  final int? isLimitByGeo;
  final List<dynamic>? topic;

  factory Detail.fromMap(Map<String, Object?> json) => Detail(
        regionId: json['region_id'] as String?,
        isLimitByGeo: json['is_limit_by_geo'] as int?,
        topic: json['topic'] != null ? List.from((json['topic'] as List)) : [],
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'regionId': regionId,
        'isLimitByGeo': isLimitByGeo,
        'topic': topic,
      };

  @override
  bool operator ==(covariant Detail other) {
    if (identical(this, other)) return true;

    return other.regionId == regionId &&
        other.isLimitByGeo == isLimitByGeo &&
        listEquals(other.topic, topic);
  }

  @override
  int get hashCode =>
      regionId.hashCode ^ isLimitByGeo.hashCode ^ topic.hashCode;

  Detail copyWith({
    String? regionId,
    int? isLimitByGeo,
    List<String>? topic,
  }) =>
      Detail(
        regionId: regionId ?? this.regionId,
        isLimitByGeo: isLimitByGeo ?? this.isLimitByGeo,
        topic: topic ?? this.topic,
      );

  @override
  String toString() => 'Detail('
      'regionId: $regionId,'
      'isLimitByGeo: $isLimitByGeo,'
      'topic: $topic)';
}
