import 'package:qbox_mobile/src/core/constants/api_constants.dart';

class TaskModel {
  final int id;
  final String title;
  final String photo;
  final String trackId;

  const TaskModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.trackId,
  });

  factory TaskModel.fromJson(Map<String, Object?> json) => TaskModel(
        id: json['id'] as int,
        title: json['title'] as String? ?? 'No name',
        trackId: "ID:${(json['track_id'] as String)}",
        photo:
            "${ApiConstants.baseUrl}${(json['author'] as Map<String, Object?>? ?? {
                  'photo': '',
                })['photo'] as String? ?? ''}",
      );

  @override
  String toString() => 'TicketModel('
      'id: $id,'
      'title: $title,'
      'photo: $photo,'
      'trackId: $trackId)';
}
