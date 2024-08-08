class Role {
  final int id;
  final String? title;

  Role({
    required this.id,
    required this.title,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  String toString() {
    return 'Role{id: $id, title: $title}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Role &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}

class CreatedByModel {
  final int userId;
  final String? displayName;

  CreatedByModel({
    required this.userId,
    required this.displayName,
  });

  factory CreatedByModel.fromJson(Map<String, dynamic> json) {
    return CreatedByModel(
      userId: json['user_id'] as int,
      displayName: json['display_name'] as String? ?? "",
    );
  }
}

class BlockedByModel {
  final int? userId;
  final String? displayName;

  BlockedByModel({
    this.userId,
    this.displayName,
  });

  factory BlockedByModel.fromJson(Map<String, dynamic> json) {
    return BlockedByModel(
      userId: json['user_id'] as int?,
      displayName: json['display_name'] as String?,
    );
  }
}

class DeletedByModel {
  final int? userId;
  final String? displayName;

  DeletedByModel({
    this.userId,
    this.displayName,
  });

  factory DeletedByModel.fromJson(Map<String, dynamic> json) {
    return DeletedByModel(
      userId: json['user_id'] as int?,
      displayName: json['display_name'] as String?,
    );
  }
}
