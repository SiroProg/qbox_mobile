import 'dart:convert';

// Модель для вызова (Call)
class Call {
  final int id;
  final String callId;
  final String caller;
  final String media;
  final String queueKey;
  final int queuedAt;
  final int waitTime;
  final int updatedAt;

  Call({
    required this.id,
    required this.callId,
    required this.caller,
    required this.media,
    required this.queueKey,
    required this.queuedAt,
    required this.waitTime,
    required this.updatedAt,
  });

  factory Call.fromJson(Map<String, dynamic> json) {
    return Call(
      id: json['id'] as int,
      callId: json['call_id'] as String,
      caller: json['caller'] as String,
      media: json['media'] as String,
      queueKey: json['queue_key'] as String,
      queuedAt: json['queued_at'] as int,
      waitTime: json['wait_time'] as int,
      updatedAt: json['updated_at'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'call_id': callId,
      'caller': caller,
      'media': media,
      'queue_key': queueKey,
      'queued_at': queuedAt,
      'wait_time': waitTime,
      'updated_at': updatedAt,
    };
  }

  @override
  String toString() => 'Call(id: $id, callId: $callId, caller: $caller, media: $media, queueKey: $queueKey, queuedAt: $queuedAt, waitTime: $waitTime, updatedAt: $updatedAt)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Call &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              callId == other.callId &&
              caller == other.caller &&
              media == other.media &&
              queueKey == other.queueKey &&
              queuedAt == other.queuedAt &&
              waitTime == other.waitTime &&
              updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      id.hashCode ^
      callId.hashCode ^
      caller.hashCode ^
      media.hashCode ^
      queueKey.hashCode ^
      queuedAt.hashCode ^
      waitTime.hashCode ^
      updatedAt.hashCode;
}

// Модель для основного объекта данных (MissedCallsData)
class MissedCallsData {
  final List<Call> calls;
  final int total;

  MissedCallsData({required this.calls, required this.total});

  factory MissedCallsData.fromJson(Map<String, dynamic> json) {
    var callsList = json['data'] as List;
    return MissedCallsData(
      calls: callsList.map((i) => Call.fromJson(i)).toList(),
      total: json['total'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': calls.map((i) => i.toJson()).toList(),
      'total': total,
    };
  }

  @override
  String toString() => 'MissedCallsData(calls: $calls, total: $total)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MissedCallsData &&
              runtimeType == other.runtimeType &&
              calls == other.calls &&
              total == other.total;

  @override
  int get hashCode => calls.hashCode ^ total.hashCode;
}
