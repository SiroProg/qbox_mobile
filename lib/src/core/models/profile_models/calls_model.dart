import 'queues_model.dart';

class CallsModel {
  final String webrtcLibrary;
  final bool videoStreamEnabled;
  final bool audioStreamEnabled;
  final String? sipId;
  final String? sipServerId;
  final List<String> callTypes;
  final List<QueueModel>? queues;
  final List<dynamic> autoPickup;
  final int operationCard;
  final bool? isBmg;
  final List<String> skills;
  final dynamic timedAutoAnswer;

  CallsModel({
    required this.webrtcLibrary,
    required this.videoStreamEnabled,
    required this.audioStreamEnabled,
    required this.sipId,
    required this.sipServerId,
    required this.callTypes,
    required this.queues,
    required this.autoPickup,
    required this.operationCard,
    required this.isBmg,
    required this.skills,
    required this.timedAutoAnswer,
  });

  factory CallsModel.fromJson(Map<String, dynamic> json) {
    return CallsModel(
      webrtcLibrary: json['webrtc_library'] as String,
      videoStreamEnabled: json['video_stream_enabled'] as bool,
      audioStreamEnabled: json['audio_stream_enabled'] as bool,
      sipId: json['sip_id'] as String?,
      sipServerId: json['sip_server_id'] as String?,
      callTypes: (json['call_types'] as List).map((e) => e as String).toList(),
      queues: (json['queues'] as List<dynamic>?)
          ?.map((e) => QueueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoPickup:
      (json['auto_pickup'] as List).map((e) => e as dynamic).toList(),
      operationCard: json['operation_card'] as int,
      isBmg: json['is_bmg'] as bool?,
      skills: (json['skills'] as List).map((e) => e as String).toList(),
      timedAutoAnswer: json['timed_auto_answer'],
    );
  }
}
