class UploadModel {
  const UploadModel({
    required this.hash,
    required this.title,
    required this.url,
  });

  final String hash;
  final String title;
  final String url;

  factory UploadModel.fromJson(Map<String, Object?> json) => UploadModel(
        hash: json['hash'] as String,
        title: json['title'] as String,
        url: json['url'] as String,
      );

  Map<String, Object?> toJson(String chatId) => <String, Object?>{
        'key': 'new',
        'hash': hash,
        'title': title,
        'url': url,
        'type': 'file',
        'chat': chatId,
      };

  @override
  bool operator ==(covariant UploadModel other) {
    if (identical(this, other)) return true;

    return other.hash == hash && other.title == title && other.url == url;
  }

  @override
  int get hashCode => hash.hashCode ^ title.hashCode ^ url.hashCode;

  @override
  String toString() => 'UploadModel(hash: $hash, title: $title, url: $url)';
}
