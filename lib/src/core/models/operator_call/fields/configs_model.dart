class ConfigsModel {
  final String? regexp;
  final String? key;
  final int? catalogId;
  final bool? multipleSelection;

  const ConfigsModel({
    required this.regexp,
    required this.key,
    required this.catalogId,
    required this.multipleSelection,
  });

  factory ConfigsModel.fromJson(Map<String, Object?> json) => ConfigsModel(
        regexp: json['regexp'] as String?,
        key: json['key'] as String?,
        catalogId: json['catalogId'] as int?,
        multipleSelection: json['multiple_selection'] as bool?,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'regexp': regexp,
        'key': key,
        'catalog_id': catalogId,
        'multiple_selection': multipleSelection,
      };

  @override
  String toString() => 'ConfigsModel('
      'regexp: $regexp,'
      'key: $key,'
      'catalogId: $catalogId,'
      'multipleSelection: $multipleSelection)';
}
