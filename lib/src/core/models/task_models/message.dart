import 'media.dart';

class Message {
  String? from;
  String? text;
  Media? media;
  String? action;
  int? time;
  int? operatorId;

  Message({
    this.from,
    this.text,
    this.media,
    this.action,
    this.time,
    this.operatorId,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      from: json['from'],
      text: json['text'],
      media: json['media'] != null ? Media.fromJson(json['media']) : null,
      action: json['action'],
      time: json['time'],
      operatorId: json['operator'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'text': text,
      'media': media?.toJson(),
      'action': action,
      'time': time,
      'operator': operatorId,
    };
  }
}
