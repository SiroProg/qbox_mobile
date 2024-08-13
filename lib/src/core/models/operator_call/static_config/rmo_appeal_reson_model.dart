import 'package:flutter/foundation.dart';
import 'rmo_appeal_reason_value_model.dart';

class RmoAppealReasonModel {
  const RmoAppealReasonModel({
    required this.key,
    required this.required,
    required this.title,
    this.titleEn,
    this.titleKk,
    this.titleRu,
    required this.values,
  });

  final String key;
  final bool required;
  final String title;
  final String? titleEn;
  final String? titleKk;
  final String? titleRu;
  final List<RmoAppealReasonValue> values;

  factory RmoAppealReasonModel.fromJson(Map<String, Object?> json) =>
      RmoAppealReasonModel(
        key: json['key'] as String? ?? '',
        required: json['required'] as bool? ?? false,
        title: json['title'] as String,
        titleEn: json['title_en'] as String?,
        titleKk: json['title_kk'] as String?,
        titleRu: json['title_ru'] as String?,
        values: (json['values'] as List)
            .map((e) => RmoAppealReasonValue.fromJson(e))
            .toList(),
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'key': key,
        'required': required,
        'title': title,
        'title_en': titleEn,
        'title_kk': titleKk,
        'title_ru': titleRu,
        'values': values.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(covariant RmoAppealReasonModel other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.required == required &&
        other.title == title &&
        other.titleEn == titleEn &&
        other.titleKk == titleKk &&
        other.titleRu == titleRu &&
        listEquals(other.values, values);
  }

  @override
  int get hashCode =>
      key.hashCode ^
      required.hashCode ^
      title.hashCode ^
      titleEn.hashCode ^
      titleKk.hashCode ^
      titleRu.hashCode ^
      values.hashCode;

  RmoAppealReasonModel copyWith({
    String? key,
    bool? required,
    String? title,
    String? titleEn,
    String? titleKk,
    String? titleRu,
    List<RmoAppealReasonValue>? values,
  }) =>
      RmoAppealReasonModel(
        key: key ?? this.key,
        required: required ?? this.required,
        title: title ?? this.title,
        titleEn: titleEn ?? this.titleEn,
        titleKk: titleKk ?? this.titleKk,
        titleRu: titleRu ?? this.titleRu,
        values: values ?? this.values,
      );

  @override
  String toString() => 'RmoAppealReasonModel('
      'key: $key,'
      'required: $required,'
      'title: $title,'
      'titleEn: $titleEn,'
      'titleKk: $titleKk,'
      'titleRu: $titleRu,'
      'values: $values)';
}
