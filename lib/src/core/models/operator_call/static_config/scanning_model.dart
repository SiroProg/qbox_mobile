import 'package:flutter/foundation.dart';

class ScanningModel {
  const ScanningModel({required this.webChannels});

  final List<String> webChannels;

  factory ScanningModel.fromJson(Map<String, Object?> json) => ScanningModel(
        webChannels: List<String>.from(json['web_channels'] as List),
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'web_channels': webChannels,
      };

  @override
  bool operator ==(covariant ScanningModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.webChannels, webChannels);
  }

  @override
  int get hashCode => webChannels.hashCode;

  ScanningModel copyWith({
    List<String>? webChannels,
  }) =>
      ScanningModel(
        webChannels: webChannels ?? this.webChannels,
      );

  @override
  String toString() => 'ScanningModel(webChannels: $webChannels)';
}
