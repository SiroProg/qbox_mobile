import 'package:flutter/material.dart';

class StatusModel {
  const StatusModel({
    required this.id,
    required this.title,
    required this.ordering,
    required this.projectId,
    required this.type,
    required this.value,
    required this.color,
  });

  final int id;
  final String title;
  final int ordering;
  final int projectId;
  final int type;
  final String value;
  final Color color;

  factory StatusModel.fromJson(Map<String, Object?> json) => StatusModel(
        id: json['id'] as int,
        title: json['title'] as String,
        ordering: json['ordering'] as int,
        projectId: json['project_id'] as int,
        type: json['type'] as int,
        value: _getStatusValue(json['type'] as int),
        color: _getStatusColor(json['type'] as int),
      );

  static String _getStatusValue(int typeId) => switch (typeId) {
        1 => 'Новый',
        4 => 'В работе',
        3 => 'Выполнено',
        6 => 'Отклоненные',
        10 => 'Закрыто',
        8 => 'Возрашения',
        -1 => 'В архиве',
        _ => ''
      };

  static Color _getStatusColor(int typeId) => switch (typeId) {
        1 => _hexToColor('#167DFF'),
        4 => _hexToColor('#FE6D70'),
        3 => _hexToColor('#54B576'),
        6 => _hexToColor('#7D50AF'),
        10 => _hexToColor('#818284'),
        8 => _hexToColor('#8898AA'),
        -1 => _hexToColor('#FFBF58'),
        _ => _hexToColor('#FFBF58'),
      };

  static Color _hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
