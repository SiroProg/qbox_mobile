import 'package:flutter/foundation.dart';

class ConfigModel {
  const ConfigModel({
    required this.redirectTo,
    required this.seeFolderIds,
  });

  final String? redirectTo;
  final List<dynamic> seeFolderIds;

  Map<String, Object?> toJson() => <String, Object?>{
        'redirectTo': redirectTo,
        'seeFolderIds': seeFolderIds,
      };

  factory ConfigModel.fromJson(Map<String, Object?> json) => ConfigModel(
        redirectTo: json['redirect_to'] as String?,
        seeFolderIds: json['see_folder_ids'] != null
            ? List.from(
                (json['see_folder_ids'] as List),
              )
            : [],
      );

  @override
  bool operator ==(covariant ConfigModel other) {
    if (identical(this, other)) return true;

    return other.redirectTo == redirectTo &&
        listEquals(other.seeFolderIds, seeFolderIds);
  }

  @override
  int get hashCode => redirectTo.hashCode ^ seeFolderIds.hashCode;

  ConfigModel copyWith({
    String? redirectTo,
    List<int>? seeFolderIds,
  }) =>
      ConfigModel(
        redirectTo: redirectTo ?? this.redirectTo,
        seeFolderIds: seeFolderIds ?? this.seeFolderIds,
      );

  @override
  String toString() => 'ConfigModel('
      'redirectTo: $redirectTo,'
      'seeFolderIds: $seeFolderIds)';
}
