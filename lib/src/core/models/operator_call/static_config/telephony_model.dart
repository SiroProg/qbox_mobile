import 'package:flutter/foundation.dart';
import 'callback_model.dart';

import 'region_model.dart';

class TelephonyModel {
  const TelephonyModel({
    required this.callLangs,
    required this.callReasons,
    required this.callServicedReasons,
    required this.callback,
    required this.queues,
    required this.regions,
    required this.uri,
    required this.wsServers,
  });

  final Map<String, String>? callLangs;
  final Map<String, Map<String, String>?>? callReasons;
  final List<String> callServicedReasons;
  final CallbackModel callback;
  final List<String> queues;
  final List<RegionModel> regions;
  final String uri;
  final List<String> wsServers;

  factory TelephonyModel.fromJson(Map<String, Object?> json) => TelephonyModel(
        callLangs:
            Map<String, String>.from(json['call_langs'] as Map<String, String>),
        callReasons: (json['call_reasons'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(
            k,
            Map<String, String>.from(e),
          ),
        ),
        callServicedReasons:
            List<String>.from(json['call_serviced_reasons'] as List),
        callback:
            CallbackModel.fromJson(json['callback'] as Map<String, Object?>),
        queues: List<String>.from(json['queues'] as List),
        regions: (json['regions'] as List)
            .map((e) => RegionModel.fromJson(e))
            .toList(),
        uri: json['uri'] as String? ?? 'null',
        wsServers: List<String>.from(json['ws_servers'] as List),
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'call_langs': callLangs,
        'call_reasons': callReasons?.map((k, e) => MapEntry(
              k,
              e,
            )),
        'call_serviced_reasons': callServicedReasons,
        'callback': callback.toJson(),
        'queues': queues,
        'regions': regions.map((e) => e.toJson()).toList(),
        'uri': uri,
        'ws_servers': wsServers,
      };

  @override
  bool operator ==(covariant TelephonyModel other) {
    if (identical(this, other)) return true;

    return mapEquals(other.callLangs, callLangs) &&
        mapEquals(other.callReasons, callReasons) &&
        listEquals(other.callServicedReasons, callServicedReasons) &&
        other.callback == callback &&
        listEquals(other.queues, queues) &&
        listEquals(other.regions, regions) &&
        other.uri == uri &&
        listEquals(other.wsServers, wsServers);
  }

  @override
  int get hashCode =>
      callLangs.hashCode ^
      callReasons.hashCode ^
      callServicedReasons.hashCode ^
      callback.hashCode ^
      queues.hashCode ^
      regions.hashCode ^
      uri.hashCode ^
      wsServers.hashCode;

  TelephonyModel copyWith({
    Map<String, String>? callLangs,
    Map<String, Map<String, String>>? callReasons,
    List<String>? callServicedReasons,
    CallbackModel? callback,
    List<String>? queues,
    List<RegionModel>? regions,
    String? uri,
    List<String>? wsServers,
  }) =>
      TelephonyModel(
        callLangs: callLangs ?? this.callLangs,
        callReasons: callReasons ?? this.callReasons,
        callServicedReasons: callServicedReasons ?? this.callServicedReasons,
        callback: callback ?? this.callback,
        queues: queues ?? this.queues,
        regions: regions ?? this.regions,
        uri: uri ?? this.uri,
        wsServers: wsServers ?? this.wsServers,
      );

  @override
  String toString() => 'TelephonyModel('
      'callLangs: $callLangs,'
      'callReasons: $callReasons,'
      'callServicedReasons: $callServicedReasons,'
      'callback: $callback,'
      'queues: $queues,'
      'regions: $regions,'
      'uri: $uri, wsServers: $wsServers)';
}
