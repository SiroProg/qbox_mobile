import 'detail_model.dart';

class UserGroupModel {
  const UserGroupModel({
    required this.id,
    required this.title,
    required this.status,
    required this.details,
    required this.level,
    required this.parentId,
    required this.usersCount,
  });

  final int id;
  final String title;
  final int status;
  final Detail details;
  final int level;
  final int parentId;
  final int usersCount;

  factory UserGroupModel.fromJson(Map<String, Object?> json) => UserGroupModel(
        id: json['id'] as int,
        title: json['title'] as String,
        status: json['status'] as int,
        details: Detail.fromMap(json['details'] as Map<String, Object?>? ?? {}),
        level: json['level'] as int,
        parentId: json['parent_id'] as int,
        usersCount: json['users_count'] as int,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'status': status,
        'details': details.toJson(),
        'level': level,
        'parentId': parentId,
        'usersCount': usersCount,
      };

  @override
  bool operator ==(covariant UserGroupModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.status == status &&
        other.details == details &&
        other.level == level &&
        other.parentId == parentId &&
        other.usersCount == usersCount;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      status.hashCode ^
      details.hashCode ^
      level.hashCode ^
      parentId.hashCode ^
      usersCount.hashCode;

  UserGroupModel copyWith({
    int? id,
    String? title,
    int? status,
    Detail? details,
    int? level,
    int? parentId,
    int? usersCount,
  }) =>
      UserGroupModel(
        id: id ?? this.id,
        title: title ?? this.title,
        status: status ?? this.status,
        details: details ?? this.details,
        level: level ?? this.level,
        parentId: parentId ?? this.parentId,
        usersCount: usersCount ?? this.usersCount,
      );

  @override
  String toString() => 'UserGroupModel('
      'id: $id,'
      'title: $title,'
      'status: $status,'
      'details: $details,'
      'level: $level,'
      'parentId: $parentId,'
      'usersCount: $usersCount)';
}
