class ValuesModel {
  const ValuesModel({
    required this.id,
    required this.title,
    this.titleKk,
    this.titleRu,
    this.titleEn,
  });

  final int id;
  final String title;
  final String? titleKk;
  final String? titleRu;
  final String? titleEn;

  factory ValuesModel.fromJson(Map<String, Object?> json) => ValuesModel(
        id: json['id'] as int,
        title: json['title'] as String? ?? 'null',
        titleKk: json['title_kk'] as String?,
        titleRu: json['title_ru'] as String?,
        titleEn: json['title_en'] as String?,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'title_kk': titleKk,
        'title_ru': titleRu,
        'title_en': titleEn,
      };

  @override
  String toString() => 'ValuesModel('
      'id: $id,'
      'title: $title,'
      'titleKk: $titleKk,'
      'titleRu: $titleRu,'
      'titleEn: $titleEn)';
}
