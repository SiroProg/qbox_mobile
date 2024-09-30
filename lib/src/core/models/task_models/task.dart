import 'configs_model.dart';
import 'project.dart';
import 's_form_model.dart';
import 'smt.dart';

class Task {
  const Task({
    this.id,
    this.trackId,
    this.authorId,
    this.title,
    required this.project,
    this.participant,
    this.projectMemberType,
    this.description,
    this.descriptionBlocks,
    this.status,
    this.statusType,
    this.statusTitle,
    this.assignee,
    this.datetime,
    this.rating,
    this.isSupport,
    this.isParent,
    this.parentId,
    this.resolved,
    this.priority,
    this.type,
    this.tags,
    this.checklists,
    this.attachments,
    this.attachmentsV2,
    this.sformId,
    required this.sform,
    required this.configs,
    this.sender,
    this.movedFromProjectId,
    this.movableStatuses,
    required this.stm,
    this.requestRepeatCount,
    this.subscribers,
    this.responseV2,
    this.responseAuthor,
    this.externalId,
    this.deadline,
    this.deadlineCloseFact,
    this.deadlineStatus,
    this.deadlineAmount,
    this.timeReactPlan,
    this.timeReactFact,
    this.timeReactStatus,
    this.timeReactAmount,
    this.timeClosePlan,
    this.timeCloseFact,
    this.timeCloseStatus,
    this.timeCloseAmount,
  });

  final int? id;
  final String? trackId;
  final int? authorId;
  final String? title;
  final Project? project;
  final bool? participant;
  final dynamic projectMemberType;
  final String? description;
  final List? descriptionBlocks;
  final int? status;
  final int? statusType;
  final String? statusTitle;
  final List? assignee;
  final int? datetime;
  final int? rating;
  final int? isSupport;
  final bool? isParent;
  final int? parentId;
  final dynamic resolved;
  final dynamic priority;
  final dynamic type;
  final dynamic tags;
  final List? checklists;
  final List? attachments;
  final List? attachmentsV2;
  final int? sformId;
  final SForm? sform;
  final Configs? configs;
  final String? sender;
  final int? movedFromProjectId;
  final List? movableStatuses;
  final Stm? stm;
  final int? requestRepeatCount;
  final List? subscribers;
  final dynamic responseV2;
  final dynamic responseAuthor;
  final dynamic externalId;
  final dynamic deadline;
  final dynamic deadlineCloseFact;
  final dynamic deadlineStatus;
  final dynamic deadlineAmount;
  final int? timeReactPlan;
  final dynamic timeReactFact;
  final String? timeReactStatus;
  final int? timeReactAmount;
  final dynamic timeClosePlan;
  final dynamic timeCloseFact;
  final dynamic timeCloseStatus;
  final dynamic timeCloseAmount;

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json['id'],
        trackId: json['track_id'],
        authorId: json['author_id'],
        title: json['title'],
        project:
            json['project'] != null ? Project.fromJson(json['project']) : null,
        participant: json['participant'],
        projectMemberType: json['project_member_type'],
        description: json['description'],
        descriptionBlocks: json['description_blocks'],
        status: json['status'],
        statusType: json['status_type'],
        statusTitle: json['status_title'],
        assignee: json['assignee'],
        datetime: json['datetime'],
        rating: json['rating'],
        isSupport: json['is_support'],
        isParent: json['is_parent'],
        parentId: json['parent_id'],
        resolved: json['resolved'],
        priority: json['priority'],
        type: json['type'],
        tags: json['tags'],
        checklists: json['checklists'],
        attachments: json['attachments'],
        attachmentsV2: json['attachments_v2'],
        sformId: json['sform_id'],
        sform: json['sform'] != null ? SForm.fromJson(json['sform']) : null,
        configs:
            json['configs'] != null ? Configs.fromJson(json['configs']) : null,
        sender: json['sender'],
        movedFromProjectId: json['moved_from_project_id'],
        movableStatuses: json['movable_statuses'],
        stm: json['stm'] != null ? Stm.fromJson(json['stm']) : null,
        requestRepeatCount: json['request_repeat_count'],
        subscribers: json['subscribers'],
        responseV2: json['response_v2'],
        responseAuthor: json['response_author'],
        externalId: json['external_id'],
        deadline: json['deadline'],
        deadlineCloseFact: json['deadline_close_fact'],
        deadlineStatus: json['deadline_status'],
        deadlineAmount: json['deadline_amount'],
        timeReactPlan: json['time_react_plan'],
        timeReactFact: json['time_react_fact'],
        timeReactStatus: json['time_react_status'],
        timeReactAmount: json['time_react_amount'],
        timeClosePlan: json['time_close_plan'],
        timeCloseFact: json['time_close_fact'],
        timeCloseStatus: json['time_close_status'],
        timeCloseAmount: json['time_close_amount'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'trackId': trackId,
        'authorId': authorId,
        'title': title,
        'project': project?.toJson(),
        'participant': participant,
        'projectMemberType': projectMemberType,
        'description': description,
        'descriptionBlocks': descriptionBlocks,
        'status': status,
        'statusType': statusType,
        'statusTitle': statusTitle,
        'assignee': assignee,
        'datetime': datetime,
        'rating': rating,
        'isSupport': isSupport,
        'isParent': isParent,
        'parentId': parentId,
        'resolved': resolved,
        'priority': priority,
        'type': type,
        'tags': tags,
        'checklists': checklists,
        'attachments': attachments,
        'attachmentsV2': attachmentsV2,
        'sformId': sformId,
        'sform': sform?.toJson(),
        'configs': configs?.toJson(),
        'sender': sender,
        'movedFromProjectId': movedFromProjectId,
        'movableStatuses': movableStatuses,
        'stm': stm?.toJson(),
        'requestRepeatCount': requestRepeatCount,
        'subscribers': subscribers,
        'responseV2': responseV2,
        'responseAuthor': responseAuthor,
        'externalId': externalId,
        'deadline': deadline,
        'deadlineCloseFact': deadlineCloseFact,
        'deadlineStatus': deadlineStatus,
        'deadlineAmount': deadlineAmount,
        'timeReactPlan': timeReactPlan,
        'timeReactFact': timeReactFact,
        'timeReactStatus': timeReactStatus,
        'timeReactAmount': timeReactAmount,
        'timeClosePlan': timeClosePlan,
        'timeCloseFact': timeCloseFact,
        'timeCloseStatus': timeCloseStatus,
        'timeCloseAmount': timeCloseAmount,
      };

  @override
  String toString() => 'Task('
      'id: $id,'
      'trackId: $trackId,'
      'authorId: $authorId,'
      'title: $title,'
      'project: $project,'
      'participant: $participant,'
      'projectMemberType: $projectMemberType,'
      'description: $description,'
      'descriptionBlocks: $descriptionBlocks,'
      'status: $status,'
      'statusType: $statusType,'
      'statusTitle: $statusTitle,'
      'assignee: $assignee,'
      'datetime: $datetime,'
      'rating: $rating,'
      'isSupport: $isSupport,'
      'isParent: $isParent,'
      'parentId: $parentId,'
      'resolved: $resolved,'
      'priority: $priority,'
      'type: $type,'
      'tags: $tags,'
      'checklists: $checklists,'
      'attachments: $attachments,'
      'attachmentsV2: $attachmentsV2,'
      'sformId: $sformId,'
      'sform: $sform,'
      'configs: $configs,'
      'sender: $sender,'
      'movedFromProjectId: $movedFromProjectId,'
      'movableStatuses: $movableStatuses,'
      'stm: $stm,'
      'requestRepeatCount: $requestRepeatCount,'
      'subscribers: $subscribers,'
      'responseV2: $responseV2,'
      'responseAuthor: $responseAuthor,'
      'externalId: $externalId,'
      'deadline: $deadline,'
      'deadlineCloseFact: $deadlineCloseFact,'
      'deadlineStatus: $deadlineStatus,'
      'deadlineAmount: $deadlineAmount,'
      'timeReactPlan: $timeReactPlan,'
      'timeReactFact: $timeReactFact,'
      'timeReactStatus: $timeReactStatus,'
      'timeReactAmount: $timeReactAmount,'
      'timeClosePlan: $timeClosePlan,'
      'timeCloseFact: $timeCloseFact,'
      'timeCloseStatus: $timeCloseStatus,'
      'timeCloseAmount: $timeCloseAmount,'
      ')';
}
