import 'package:flutter/cupertino.dart';
import 'package:qbox_mobile/src/core/constants/api_constants.dart';

@immutable
class ProjectModel {
  const ProjectModel({
    required this.id,
    required this.title,
    required this.status,
    required this.configs,
    required this.icon,
    required this.groupsCount,
    required this.groupsBranchCount,
    required this.responsesCount,
    required this.responsesBranchCount,
  });

  final int id;
  final String title;
  final int status;
  final Map<String, Object?> configs;
  final String? icon;
  final int groupsCount;
  final int groupsBranchCount;
  final int responsesCount;
  final int responsesBranchCount;

  factory ProjectModel.fromJson(Map<String, Object?> json) => ProjectModel(
        id: json['id'] as int,
        title: json['title'] as String,
        status: json['status'] as int,
        configs: Map<String, Object?>.from(
            (json['configs'] as Map<String, Object?>)),
        icon: json['icon'] == null
            ? null
            : "${ApiConstants.baseUrl}${(json['icon'] as String)}",
        groupsCount: json['groups_count'] as int,
        groupsBranchCount: json['groups_branch_count'] as int,
        responsesCount: json['responses_count'] as int,
        responsesBranchCount: json['responses_branch_count'] as int,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'status': status,
        'configs': configs,
        'icon': icon,
        'groups_count': groupsCount,
        'groups_branch_count': groupsBranchCount,
        'responses_count': responsesCount,
        'responses_branch_count': responsesBranchCount,
      };

  @override
  String toString() => 'ProjectModel('
      'id: $id,'
      'title: $title,'
      'status: $status,'
      'configs: $configs,'
      'icon: $icon,'
      'groupsCount: $groupsCount,'
      'groupsBranchCount: $groupsBranchCount,'
      'responsesCount: $responsesCount,'
      'responsesBranchCount: $responsesBranchCount)';
}
