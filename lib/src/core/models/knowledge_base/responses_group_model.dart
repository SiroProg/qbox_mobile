import 'package:flutter/cupertino.dart';

@immutable
class ResponsesGroupModel {
  const ResponsesGroupModel({
    required this.id,
    required this.title,
    required this.lang,
    required this.parentId,
    required this.photo,
    required this.keywords,
    required this.responses,
    required this.counters,
    required this.datetime,
    required this.config,
    required this.authorId,
    required this.projectId,
    required this.status,
    required this.oldId,
    required this.icon,
    required this.responsesCount,
    required this.groupsCount,
    required this.responsesBranchCount,
    required this.groupsBranchCount,
  });

  final int id;
  final String title;
  final int lang;
  final int parentId;
  final String? photo;
  final String? keywords;
  final String? responses;
  final List<int> counters;
  final int datetime;
  final Map<String, Object?> config;
  final int authorId;
  final int projectId;
  final int status;
  final int oldId;
  final String? icon;
  final int responsesCount;
  final int groupsCount;
  final int responsesBranchCount;
  final int groupsBranchCount;

  factory ResponsesGroupModel.fromJson(Map<String, Object?> json) =>
      ResponsesGroupModel(
        id: json['id'] as int,
        title: json['title'] as String,
        lang: json['lang'] as int,
        parentId: json['parent_Id'] as int,
        photo: json['photo'] as String?,
        keywords: json['keywords'] as String?,
        responses: json['responses'] as String?,
        counters: List<int>.from((json['counters'] as List<int>)),
        datetime: json['datetime'] as int,
        config:
            Map<String, Object?>.from((json['config'] as Map<String, Object?>)),
        authorId: json['author_id'] as int,
        projectId: json['project_id'] as int,
        status: json['status'] as int,
        oldId: json['old_id'] as int,
        icon: json['icon'] as String?,
        responsesCount: json['responses_count'] as int,
        groupsCount: json['groups_count'] as int,
        responsesBranchCount: json['responses_branch_count'] as int,
        groupsBranchCount: json['groups_branch_count'] as int,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'lang': lang,
        'parent_id': parentId,
        'photo': photo,
        'keywords': keywords,
        'responses': responses,
        'counters': counters,
        'datetime': datetime,
        'config': config,
        'author_id': authorId,
        'project_id': projectId,
        'status': status,
        'old_id': oldId,
        'icon': icon,
        'responses_count': responsesCount,
        'groups_count': groupsCount,
        'responses_branch_count': responsesBranchCount,
        'groups_branch_count': groupsBranchCount,
      };

  @override
  String toString() => 'ResponsesGroupModel('
      'id: $id,'
      'title: $title,'
      'lang: $lang,'
      'parentId: $parentId,'
      'photo: $photo,'
      'keywords: $keywords,'
      'responses: $responses,'
      'counters: $counters,'
      'datetime: $datetime,'
      'config: $config,'
      'authorId: $authorId,'
      'projectId: $projectId,'
      'status: $status,'
      'oldId: $oldId,'
      'icon: $icon,'
      'responsesCount: $responsesCount,'
      'groupsCount: $groupsCount,'
      'responsesBranchCount: $responsesBranchCount,'
      'groupsBranchCount: $groupsBranchCount)';
}
