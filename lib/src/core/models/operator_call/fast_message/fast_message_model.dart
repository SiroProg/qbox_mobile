class FastMessageModel {
  const FastMessageModel({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    required this.status,
    required this.lang,
    required this.datetime,
  });

  final int id;
  final String title;
  final String description;
  final int userId;
  final int status;
  final int lang;
  final int datetime;

  factory FastMessageModel.fromJson(Map<String, Object?> json) =>
      FastMessageModel(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        userId: json['user_id'] as int,
        status: json['status'] as int,
        lang: json['lang'] as int,
        datetime: json['datetime'] as int,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'description': description,
        'userId': userId,
        'status': status,
        'lang': lang,
        'datetime': datetime,
      };

  @override
  String toString() => 'FastMessageModel('
      'id: $id,'
      'title: $title,'
      'description: $description,'
      'userId: $userId,'
      'status: $status,'
      'lang: $lang,'
      'datetime: $datetime)';
}
