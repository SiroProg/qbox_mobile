class QueueModel {
  final int id;
  final String code;
  final String? titleEn;
  final String? titleKk;
  final String? titleRu;

  QueueModel({
    required this.id,
    required this.code,
    this.titleEn,
    this.titleKk,
    this.titleRu,
  });

  factory QueueModel.fromJson(Map<String, dynamic> json) {
    return QueueModel(
      id: json['id'] ?? 0,
      code: json['code'] ?? '',
      titleEn: json['title_en'],
      titleKk: json['title_kk'],
      titleRu: json['title_ru'] ?? '',
    );
  }
}
