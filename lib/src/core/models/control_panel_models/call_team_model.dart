
class CallTeamModel {
  final List<MediaTeam>? text;
  final List<MediaTeam>? audio;
  final List<MediaTeam>? video;

  CallTeamModel({
    required this.text,
    required this.audio,
    required this.video,
  });

  factory CallTeamModel.fromJson(Map<String, dynamic> json) {
    return CallTeamModel(
      text: (json['text'] as List?)?.map((i) => MediaTeam.fromJson(i)).toList() ?? [],
      audio: (json['audio'] as List?)?.map((i) => MediaTeam.fromJson(i)).toList() ?? [],
      video: (json['video'] as List?)?.map((i) => MediaTeam.fromJson(i)).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text?.map((team) => team.toJson()).toList() ?? [],
      'audio': audio?.map((team) => team.toJson()).toList() ?? [],
      'video': video?.map((team) => team.toJson()).toList() ?? [],
    };
  }
}

class MediaTeam {
  final int id;
  final String title;
  final int free;
  final int total;

  MediaTeam({
    required this.id,
    required this.title,
    required this.free,
    required this.total,
  });

  factory MediaTeam.fromJson(Map<String, dynamic> json) {
    return MediaTeam(
      id: json['id'],
      title: json['title'],
      free: json['free'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'free': free,
      'total': total,
    };
  }
}
