class PositionModel {
  final int? id;
  final String? titleEn;
  final String? titleKk;
  final String? titleRu;
  final bool? isActive;

  PositionModel({
    this.id,
    this.titleEn,
    this.titleKk,
    this.titleRu,
    this.isActive,
  });

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(
      id: json['id'] as int?,
      titleEn: json['title_en'] as String?,
      titleKk: json['title_kk'] as String?,
      titleRu: json['title_ru'] as String?,
      isActive: json['is_active'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title_en': titleEn,
      'title_kk': titleKk,
      'title_ru': titleRu,
      'is_active': isActive,
    };
  }
}
