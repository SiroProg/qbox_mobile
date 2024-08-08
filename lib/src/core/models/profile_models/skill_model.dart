class SkillModel {
  final int id;
  final String titleEn;
  final String titleKk;
  final String titleRu;
  final bool isActive;
  final String icon;

  SkillModel({
    required this.id,
    required this.titleEn,
    required this.titleKk,
    required this.titleRu,
    required this.isActive,
    required this.icon,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      id: json['id'] as int,
      titleEn: json['title_en'] as String,
      titleKk: json['title_kk'] as String,
      titleRu: json['title_ru'] as String,
      isActive: json['is_active'] as bool,
      icon: json['icon'] as String,
    );
  }
}
