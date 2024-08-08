import 'package:flutter/foundation.dart';

class Notifications {
  final Map<String, int> counters;

  Notifications({
    required this.counters,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      counters: Map<String, int>.from(json['counters'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['counters'] = counters;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Notifications &&
        mapEquals(other.counters, counters);
  }

  @override
  int get hashCode {
    return counters.hashCode;
  }
}