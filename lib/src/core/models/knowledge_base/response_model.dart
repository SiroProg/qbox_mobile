import 'package:flutter/cupertino.dart';

@immutable
class ResponseModel {
  const ResponseModel({
    required this.id,
    required this.keywords,
    required this.response,
    required this.title,
    required this.rank,
    required this.categoryId,
    required this.extra,
    required this.lang,
    required this.datetime,
    required this.status,
    required this.editedDatetime,
    required this.config,
    required this.authorId,
    required this.projectId,
    required this.oldId,
    required this.tags,
    required this.categoryTitle,
  });

  final int id;
  final String? keywords;
  final String response;
  final String title;
  final int rank;
  final int categoryId;
  final Map<String, Object?> extra;
  final int lang;
  final int datetime;
  final int status;
  final int editedDatetime;
  final Map<String, Object?> config;
  final int authorId;
  final int projectId;
  final int oldId;
  final List<dynamic> tags;
  final String categoryTitle;

  factory ResponseModel.fromJson(Map<String, Object?> json) => ResponseModel(
        id: json['id'] as int,
        keywords: json['keywords'] as String?,
        response: json['response'] as String,
        title: json['title'] as String,
        rank: json['rank'] as int,
        categoryId: json['category_id'] as int,
        extra: Map<String, Object?>.from(
          (json['extra'] as Map<String, Object?>),
        ),
        lang: json['lang'] as int,
        datetime: json['datetime'] as int,
        status: json['status'] as int,
        editedDatetime: json['edited_datetime'] as int,
        config: Map<String, Object?>.from(
          (json['config'] as Map<String, Object?>),
        ),
        authorId: json['author_id'] as int,
        projectId: json['project_id'] as int,
        oldId: json['oldId'] as int,
        tags: List<dynamic>.from(json['tags'] as List),
        categoryTitle: json['category_title'] as String,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'keywords': keywords,
        'response': response,
        'title': title,
        'rank': rank,
        'category_id': categoryId,
        'extra': extra,
        'lang': lang,
        'datetime': datetime,
        'status': status,
        'edited_datetime': editedDatetime,
        'config': config,
        'author_id': authorId,
        'project_id': projectId,
        'old_id': oldId,
        'tags': {},
        'category_title': categoryTitle,
      };

  @override
  String toString() => 'ResponseModel('
      'id: $id,'
      'keywords: $keywords,'
      'response: $response,'
      'title: $title,'
      'rank: $rank,'
      'categoryId: $categoryId,'
      'extra: $extra,'
      'lang: $lang,'
      'datetime: $datetime,'
      'status: $status,'
      'editedDatetime: $editedDatetime,'
      'config: $config,'
      'authorId: $authorId,'
      'projectId: $projectId,'
      'oldId: $oldId,'
      'tags: $tags,'
      'categoryTitle: $categoryTitle)';
}
