import 'queues_model.dart';

class CallsModel {
  final String? webrtcLibrary;
  final bool? videoStreamEnabled;
  final bool? audioStreamEnabled;
  final String? sipId;
  final String? sipServerId;
  final List<String>? callTypes;
  final List<QueueModel>? queues;
  final List<dynamic>? autoPickup;
  final int? operationCard;
  final bool? isBmg;
  final List<String>? skills;
  final dynamic timedAutoAnswer;

  CallsModel({
    this.webrtcLibrary,
    this.videoStreamEnabled,
    this.audioStreamEnabled,
    this.sipId,
    this.sipServerId,
    this.callTypes,
    this.queues,
    this.autoPickup,
    this.operationCard,
    this.isBmg,
    this.skills,
    this.timedAutoAnswer,
  });

  factory CallsModel.fromJson(Map<String, dynamic> json) {
    return CallsModel(
      webrtcLibrary: json['webrtc_library'] as String?,
      videoStreamEnabled: json['video_stream_enabled'] as bool?,
      audioStreamEnabled: json['audio_stream_enabled'] as bool?,
      sipId: json['sip_id'] as String?,
      sipServerId: json['sip_server_id'] as String?,
      callTypes: (json['call_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      queues: (json['queues'] as List<dynamic>?)
          ?.map((e) => QueueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      autoPickup: (json['auto_pickup'] as List<dynamic>?)
          ?.map((e) => e as dynamic)
          .toList(),
      operationCard: json['operation_card'] as int?,
      isBmg: json['is_bmg'] as bool?,
      skills:
          (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
      timedAutoAnswer: json['timed_auto_answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'webrtc_library': webrtcLibrary,
      'video_stream_enabled': videoStreamEnabled,
      'audio_stream_enabled': audioStreamEnabled,
      'sip_id': sipId,
      'sip_server_id': sipServerId,
      'call_types': callTypes,
      'queues': queues?.map((e) => e.toJson()).toList(),
      'auto_pickup': autoPickup,
      'operation_card': operationCard,
      'is_bmg': isBmg,
      'skills': skills,
      'timed_auto_answer': timedAutoAnswer,
    };
  }
}
