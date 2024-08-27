class RmoAppealReasonValue {
  const RmoAppealReasonValue({
    required this.id,
    required this.title,
    this.titleEn,
    this.titleKk,
    this.titleRu,
  });

  final int? id;
  final String title;
  final String? titleEn;
  final String? titleKk;
  final String? titleRu;

  factory RmoAppealReasonValue.fromJson(Map<String, Object?> json) =>
      RmoAppealReasonValue(
        id: json['id'] as int?,
        title: json['title'] as String? ?? 'null',
        titleEn: json['title_en'] as String?,
        titleKk: json['title_kk'] as String?,
        titleRu: json['title_ru'] as String?,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'title_en': titleEn,
        'title_kk': titleKk,
        'title_ru': titleRu,
      };

  @override
  bool operator ==(covariant RmoAppealReasonValue other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.titleEn == titleEn &&
        other.titleKk == titleKk &&
        other.titleRu == titleRu;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      titleEn.hashCode ^
      titleKk.hashCode ^
      titleRu.hashCode;

  RmoAppealReasonValue copyWith({
    int? id,
    String? title,
    String? titleEn,
    String? titleKk,
    String? titleRu,
  }) =>
      RmoAppealReasonValue(
        id: id ?? this.id,
        title: title ?? this.title,
        titleEn: titleEn ?? this.titleEn,
        titleKk: titleKk ?? this.titleKk,
        titleRu: titleRu ?? this.titleRu,
      );

  @override
  String toString() => 'RmoAppealReasonValue('
      'id: $id,'
      'title: $title,'
      'titleEn: $titleEn,'
      'titleKk: $titleKk,'
      'titleRu: $titleRu)';
}
