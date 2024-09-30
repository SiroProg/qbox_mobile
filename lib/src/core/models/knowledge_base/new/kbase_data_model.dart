// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class KbaseDataModel {
  KbaseDataModel({
    required this.id,
    required this.hash,
    required this.lang,
    required this.counters,
    required this.flags,
    required this.keywords,
    required this.title,
    required this.response,
    required this.tags,
    required this.rank,
    required this.parentId,
    required this.extra,
    required this.datetime,
    required this.updatedDatetime,
    required this.authorId,
    required this.actionId,
    required this.icon,
    required this.logo,
    required this.collectionId,
    required this.status,
    required this.oldResponseId,
    required this.oldCategoryId,
    required this.config,
    required this.ordering,
    required this.isActive,
    required this.deletedAt,
    required this.isRuFolder,
    required this.isKkFolder,
    required this.isEnFolder,
    required this.childAmount,
  });

  final int id;
  final String hash;
  final int lang;
  final List counters;
  final List flags;
  final List keywords;
  final String title;
  final dynamic response; // ?? ??
  final List tags;
  final int rank;
  final int parentId;
  final Map<String, Object?> extra;
  final int datetime;
  final int updatedDatetime;
  final int? authorId;
  final int? actionId;
  final String? icon;
  final String? logo;
  final int collectionId;
  final int status;
  final int? oldResponseId;
  final int? oldCategoryId;
  final Map<String, Object?> config;
  final int ordering;
  final bool isActive;
  final int? deletedAt;
  final int isRuFolder;
  final int isKkFolder;
  final int isEnFolder;
  int childAmount;

  factory KbaseDataModel.fromJson(
          Map<String, Object?> json, int childrenCount) =>
      KbaseDataModel(
        id: json['id'] as int,
        hash: json['hash'] as String,
        lang: json['lang'] as int,
        counters: List<int>.from((json['counters'] as List)),
        flags: List<int>.from((json['flags'] as List)),
        keywords: List.from((json['keywords'] as List)),
        title: json['title'] as String,
        response: json['response'] as dynamic,
        tags: List.from((json['tags'] as List)),
        rank: json['rank'] as int,
        parentId: json['parent_id'] as int? ?? 0,
        extra:
            Map<String, Object?>.from((json['extra'] as Map<String, Object?>)),
        datetime: json['datetime'] as int,
        updatedDatetime: json['updated_datetime'] as int,
        authorId: json['author_id'] as int?,
        actionId: json['action_id'] as int?,
        icon: json['icon'] as String?,
        logo: json['logo'] as String?,
        collectionId: json['collection_id'] as int,
        status: json['status'] as int,
        oldResponseId: json['old_response_id'] as int?,
        oldCategoryId: json['old_category_id'] as int?,
        config:
            Map<String, Object?>.from((json['config'] as Map<String, Object?>)),
        ordering: json['ordering'] as int,
        isActive: json['is_active'] as bool,
        deletedAt: json['deleted_at'] as int?,
        isRuFolder: json['is_ru_folder'] as int,
        isKkFolder: json['is_kk_folder'] as int,
        isEnFolder: json['is_en_folder'] as int,
        childAmount: childrenCount,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'hash': hash,
        'lang': lang,
        'counters': counters,
        'flags': flags,
        'keywords': keywords,
        'title': title,
        'response': response,
        'tags': tags,
        'rank': rank,
        'parentId': parentId,
        'extra': extra,
        'datetime': datetime,
        'updatedDatetime': updatedDatetime,
        'authorId': authorId,
        'actionId': actionId,
        'icon': icon,
        'logo': logo,
        'collectionId': collectionId,
        'status': status,
        'oldResponseId': oldResponseId,
        'oldCategoryId': oldCategoryId,
        'config': config,
        'ordering': ordering,
        'isActive': isActive,
        'deletedAt': deletedAt,
        'isRuFolder': isRuFolder,
        'isKkFolder': isKkFolder,
        'isEnFolder': isEnFolder,
        'childAmount': childAmount,
      };

  @override
  bool operator ==(covariant KbaseDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.hash == hash &&
        other.lang == lang &&
        listEquals(other.counters, counters) &&
        listEquals(other.flags, flags) &&
        listEquals(other.keywords, keywords) &&
        other.title == title &&
        other.response == response &&
        listEquals(other.tags, tags) &&
        other.rank == rank &&
        other.parentId == parentId &&
        mapEquals(other.extra, extra) &&
        other.datetime == datetime &&
        other.updatedDatetime == updatedDatetime &&
        other.authorId == authorId &&
        other.actionId == actionId &&
        other.icon == icon &&
        other.logo == logo &&
        other.collectionId == collectionId &&
        other.status == status &&
        other.oldResponseId == oldResponseId &&
        other.oldCategoryId == oldCategoryId &&
        mapEquals(other.config, config) &&
        other.ordering == ordering &&
        other.isActive == isActive &&
        other.deletedAt == deletedAt &&
        other.isRuFolder == isRuFolder &&
        other.isKkFolder == isKkFolder &&
        other.isEnFolder == isEnFolder &&
        other.childAmount == childAmount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        hash.hashCode ^
        lang.hashCode ^
        counters.hashCode ^
        flags.hashCode ^
        keywords.hashCode ^
        title.hashCode ^
        response.hashCode ^
        tags.hashCode ^
        rank.hashCode ^
        parentId.hashCode ^
        extra.hashCode ^
        datetime.hashCode ^
        updatedDatetime.hashCode ^
        authorId.hashCode ^
        actionId.hashCode ^
        icon.hashCode ^
        logo.hashCode ^
        collectionId.hashCode ^
        status.hashCode ^
        oldResponseId.hashCode ^
        oldCategoryId.hashCode ^
        config.hashCode ^
        ordering.hashCode ^
        isActive.hashCode ^
        deletedAt.hashCode ^
        isRuFolder.hashCode ^
        isKkFolder.hashCode ^
        isEnFolder.hashCode ^
        childAmount.hashCode;
  }

  KbaseDataModel copyWith({
    int? id,
    String? hash,
    int? lang,
    List? counters,
    List? flags,
    List? keywords,
    String? title,
    dynamic response,
    List? tags,
    int? rank,
    int? parentId,
    Map<String, Object?>? extra,
    int? datetime,
    int? updatedDatetime,
    int? authorId,
    int? actionId,
    String? icon,
    String? logo,
    int? collectionId,
    int? status,
    int? oldResponseId,
    int? oldCategoryId,
    Map<String, Object?>? config,
    int? ordering,
    bool? isActive,
    int? deletedAt,
    int? isRuFolder,
    int? isKkFolder,
    int? isEnFolder,
    int? childAmount,
  }) {
    return KbaseDataModel(
      id: id ?? this.id,
      hash: hash ?? this.hash,
      lang: lang ?? this.lang,
      counters: counters ?? this.counters,
      flags: flags ?? this.flags,
      keywords: keywords ?? this.keywords,
      title: title ?? this.title,
      response: response ?? this.response,
      tags: tags ?? this.tags,
      rank: rank ?? this.rank,
      parentId: parentId ?? this.parentId,
      extra: extra ?? this.extra,
      datetime: datetime ?? this.datetime,
      updatedDatetime: updatedDatetime ?? this.updatedDatetime,
      authorId: authorId ?? this.authorId,
      actionId: actionId ?? this.actionId,
      icon: icon ?? this.icon,
      logo: logo ?? this.logo,
      collectionId: collectionId ?? this.collectionId,
      status: status ?? this.status,
      oldResponseId: oldResponseId ?? this.oldResponseId,
      oldCategoryId: oldCategoryId ?? this.oldCategoryId,
      config: config ?? this.config,
      ordering: ordering ?? this.ordering,
      isActive: isActive ?? this.isActive,
      deletedAt: deletedAt ?? this.deletedAt,
      isRuFolder: isRuFolder ?? this.isRuFolder,
      isKkFolder: isKkFolder ?? this.isKkFolder,
      isEnFolder: isEnFolder ?? this.isEnFolder,
      childAmount: childAmount ?? this.childAmount,
    );
  }

  @override
  String toString() => 'KbaseDataModel('
      'id: $id,'
      'hash: $hash,'
      'lang: $lang,'
      'counters: $counters,'
      'flags: $flags,'
      'keywords: $keywords,'
      'title: $title,'
      'response: $response,'
      'tags: $tags,'
      'srank: $rank,'
      'parentId: $parentId,'
      'extra: $extra,'
      'datetime: $datetime,'
      'updatedDatetime: $updatedDatetime,'
      'authorId: $authorId,'
      'actionId: $actionId,'
      'icon: $icon,'
      'logo: $logo,'
      'collectionId: $collectionId,'
      'status: $status,'
      'oldResponseId: $oldResponseId,'
      'oldCategoryId: $oldCategoryId,'
      'config: $config,'
      'ordering: $ordering,'
      'isActive: $isActive,'
      'deletedAt: $deletedAt,'
      'isRuFolder: $isRuFolder,'
      'isKkFolder: $isKkFolder,'
      'isEnFolder: $isEnFolder,'
      'childAmount: $childAmount)';
}
