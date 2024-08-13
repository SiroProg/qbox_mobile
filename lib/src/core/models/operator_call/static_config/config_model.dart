import 'package:flutter/foundation.dart';
import 'mailbox_model.dart';
import 'mood_model.dart';
import 'post_processing_model.dart';
import 'rmo_appeal_reson_model.dart';
import 'scanning_model.dart';
import 'skill_group_model.dart';
import 'telephony_model.dart';
import 'topic_model.dart';
import 'user_client_type_model.dart';
import 'user_post_mistake_model.dart';
import 'user_treatment_type_model.dart';

class ConfigModel {
  const ConfigModel({
    required this.id,
    required this.errorHandlingProjectId,
    required this.mailboxes,
    required this.postProcessing,
    required this.moods,
    required this.rmoAppealReasons,
    required this.scanning,
    required this.skillGroups,
    required this.sla,
    required this.telephony,
    required this.textStartId,
    required this.textStopId,
    required this.topics,
    required this.userClientTypes,
    required this.userFeedbackFormId,
    required this.userPostMistakes,
    required this.userTreatmentTypes,
    required this.videoRecord,
  });

  final String id;
  final int errorHandlingProjectId;
  final Map<String, MailboxModel> mailboxes;
  final PostProcessingModel postProcessing;
  final List<MoodModel> moods;
  final List<RmoAppealReasonModel> rmoAppealReasons;
  final ScanningModel scanning;
  final List<SkillGroupModel> skillGroups;
  final bool sla;
  final TelephonyModel telephony;
  final int textStartId;
  final int textStopId;
  final List<TopicModel> topics;
  final List<UserClientTypeModel> userClientTypes;
  final int userFeedbackFormId;
  final List<UserPostMistakeModel> userPostMistakes;
  final List<UserTreatmentTypeModel> userTreatmentTypes;
  final bool videoRecord;

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
        id: json['id'],
        errorHandlingProjectId: json['error_handling_project_id'],
        mailboxes: (json['mailboxes'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(k, MailboxModel.fromJson(e)),
        ),
        postProcessing: PostProcessingModel.fromJson(json['post-processing']),
        moods:
            (json['moods'] as List).map((e) => MoodModel.fromJson(e)).toList(),
        rmoAppealReasons: (json['rmo_appeal_reasons'] as List)
            .map((e) => RmoAppealReasonModel.fromJson(e))
            .toList(),
        scanning: ScanningModel.fromJson(json['scanning']),
        skillGroups: (json['skill_groups'] as List)
            .map((e) => SkillGroupModel.fromJson(e))
            .toList(),
        sla: json['sla'],
        telephony: TelephonyModel.fromJson(json['telephony']),
        textStartId: json['text_start_id'],
        textStopId: json['text_stop_id'],
        topics: (json['topics'] as List)
            .map((e) => TopicModel.fromJson(e))
            .toList(),
        userClientTypes: (json['user_client_types'] as List)
            .map((e) => UserClientTypeModel.fromJson(e))
            .toList(),
        userFeedbackFormId: json['user_feedback_form_id'],
        userPostMistakes: (json['user_post_mistakes'] as List)
            .map((e) => UserPostMistakeModel.fromJson(e))
            .toList(),
        userTreatmentTypes: (json['user_treatment_types'] as List)
            .map((e) => UserTreatmentTypeModel.fromJson(e))
            .toList(),
        videoRecord: json['video_record'],
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'error_handling_project_id': errorHandlingProjectId,
        'mailboxes': mailboxes.map((k, e) => MapEntry(k, e.toJson())),
        'post-processing': postProcessing.toJson(),
        'moods': moods.map((e) => e.toJson()).toList(),
        'rmo_appeal_reasons': rmoAppealReasons.map((e) => e.toJson()).toList(),
        'scanning': scanning.toJson(),
        'skill_groups': skillGroups.map((e) => e.toJson()).toList(),
        'sla': sla,
        'telephony': telephony.toJson(),
        'text_start_id': textStartId,
        'text_stop_id': textStopId,
        'topics': topics.map((e) => e.toJson()).toList(),
        'user_client_types': userClientTypes.map((e) => e.toJson()).toList(),
        'user_feedback_form_id': userFeedbackFormId,
        'user_post_mistakes': userPostMistakes.map((e) => e.toJson()).toList(),
        'user_treatment_types':
            userTreatmentTypes.map((e) => e.toJson()).toList(),
        'video_record': videoRecord,
      };

  @override
  bool operator ==(covariant ConfigModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.errorHandlingProjectId == errorHandlingProjectId &&
        mapEquals(other.mailboxes, mailboxes) &&
        other.postProcessing == postProcessing &&
        listEquals(other.moods, moods) &&
        listEquals(other.rmoAppealReasons, rmoAppealReasons) &&
        other.scanning == scanning &&
        listEquals(other.skillGroups, skillGroups) &&
        other.sla == sla &&
        other.telephony == telephony &&
        other.textStartId == textStartId &&
        other.textStopId == textStopId &&
        listEquals(other.topics, topics) &&
        listEquals(other.userClientTypes, userClientTypes) &&
        other.userFeedbackFormId == userFeedbackFormId &&
        listEquals(other.userPostMistakes, userPostMistakes) &&
        listEquals(other.userTreatmentTypes, userTreatmentTypes) &&
        other.videoRecord == videoRecord;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      errorHandlingProjectId.hashCode ^
      mailboxes.hashCode ^
      postProcessing.hashCode ^
      moods.hashCode ^
      rmoAppealReasons.hashCode ^
      scanning.hashCode ^
      skillGroups.hashCode ^
      sla.hashCode ^
      telephony.hashCode ^
      textStartId.hashCode ^
      textStopId.hashCode ^
      topics.hashCode ^
      userClientTypes.hashCode ^
      userFeedbackFormId.hashCode ^
      userPostMistakes.hashCode ^
      userTreatmentTypes.hashCode ^
      videoRecord.hashCode;

  ConfigModel copyWith({
    String? id,
    int? errorHandlingProjectId,
    Map<String, MailboxModel>? mailboxes,
    PostProcessingModel? postProcessing,
    List<MoodModel>? moods,
    List<RmoAppealReasonModel>? rmoAppealReasons,
    ScanningModel? scanning,
    List<SkillGroupModel>? skillGroups,
    bool? sla,
    TelephonyModel? telephony,
    int? textStartId,
    int? textStopId,
    List<TopicModel>? topics,
    List<UserClientTypeModel>? userClientTypes,
    int? userFeedbackFormId,
    List<UserPostMistakeModel>? userPostMistakes,
    List<UserTreatmentTypeModel>? userTreatmentTypes,
    bool? videoRecord,
  }) =>
      ConfigModel(
        id: id ?? this.id,
        errorHandlingProjectId:
            errorHandlingProjectId ?? this.errorHandlingProjectId,
        mailboxes: mailboxes ?? this.mailboxes,
        postProcessing: postProcessing ?? this.postProcessing,
        moods: moods ?? this.moods,
        rmoAppealReasons: rmoAppealReasons ?? this.rmoAppealReasons,
        scanning: scanning ?? this.scanning,
        skillGroups: skillGroups ?? this.skillGroups,
        sla: sla ?? this.sla,
        telephony: telephony ?? this.telephony,
        textStartId: textStartId ?? this.textStartId,
        textStopId: textStopId ?? this.textStopId,
        topics: topics ?? this.topics,
        userClientTypes: userClientTypes ?? this.userClientTypes,
        userFeedbackFormId: userFeedbackFormId ?? this.userFeedbackFormId,
        userPostMistakes: userPostMistakes ?? this.userPostMistakes,
        userTreatmentTypes: userTreatmentTypes ?? this.userTreatmentTypes,
        videoRecord: videoRecord ?? this.videoRecord,
      );

  @override
  String toString() => 'ConfigModel('
      'id: $id,'
      'errorHandlingProjectId: $errorHandlingProjectId,'
      'mailboxes: $mailboxes,'
      'postProcessing: $postProcessing,'
      'moods: $moods,'
      'rmoAppealReasons: $rmoAppealReasons,'
      'scanning: $scanning,'
      'killGroups: $skillGroups,'
      'sla: $sla,'
      'telephony: $telephony,'
      'textStartId: $textStartId,'
      'textStopId: $textStopId,'
      'topics: $topics,'
      'userClientTypes: $userClientTypes,'
      'userFeedbackFormId: $userFeedbackFormId,'
      'userPostMistakes: $userPostMistakes,'
      'userTreatmentTypes: $userTreatmentTypes,'
      'videoRecord: $videoRecord)';
}
