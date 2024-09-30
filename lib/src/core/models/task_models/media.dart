import 'url.dart';

class Media {
  String? ext;
  Url? url;
  String? hash;
  String? name;
  String? type;
  String? audio;
  String? media;

  Media({
    this.ext,
    this.url,
    this.hash,
    this.name,
    this.type,
    this.audio,
    this.media,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      ext: json['ext'],
      url: Url.fromJson(json['url']),
      hash: json['hash'],
      name: json['name'],
      type: json['type'],
      audio: json['audio'],
      media: json['media'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ext': ext,
      'url': url?.toJson(),
      'hash': hash,
      'name': name,
      'type': type,
      'audio': audio,
      'media': media,
    };
  }
}
