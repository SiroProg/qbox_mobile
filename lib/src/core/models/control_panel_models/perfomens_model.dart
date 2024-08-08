class AverageRating {
  final num rating;
  final num total;

  AverageRating({
    required this.rating,
    required this.total,
  });

  factory AverageRating.fromJson(Map<String, dynamic> json) {
    return AverageRating(
      rating: json['rating'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'total': total,
    };
  }

  @override
  String toString() {
    return 'AverageRating(rating: $rating, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AverageRating &&
        other.rating == rating &&
        other.total == total;
  }

  @override
  int get hashCode => rating.hashCode ^ total.hashCode;
}

class DistinctRatings {
  final Map<String, int> ratings;

  DistinctRatings({
    required this.ratings,
  });

  factory DistinctRatings.fromJson(Map<String, dynamic> json) {
    return DistinctRatings(
      ratings: Map<String, int>.from(json),
    );
  }

  Map<String, dynamic> toJson() {
    return ratings;
  }

  @override
  String toString() {
    return 'DistinctRatings(ratings: $ratings)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DistinctRatings && other.ratings == ratings;
  }

  @override
  int get hashCode => ratings.hashCode;
}

class Calls {
  final num missed;
  final num inTime;
  final num avgTalkTime;
  final num sumTalkTime;
  final num avgWaitTime;
  final num accepted;
  final num redirected;
  final num total;

  Calls({
    required this.missed,
    required this.inTime,
    required this.avgTalkTime,
    required this.sumTalkTime,
    required this.avgWaitTime,
    required this.accepted,
    required this.redirected,
    required this.total,
  });

  factory Calls.fromJson(Map<String, dynamic> json) {
    return Calls(
      missed: json['missed'],
      inTime: json['in_time'],
      avgTalkTime: json['avg_talk_time'],
      sumTalkTime: json['sum_talk_time'],
      avgWaitTime: json['avg_wait_time'],
      accepted: json['accepted'],
      redirected: json['redirected'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'missed': missed,
      'in_time': inTime,
      'avg_talk_time': avgTalkTime,
      'sum_talk_time': sumTalkTime,
      'avg_wait_time': avgWaitTime,
      'accepted': accepted,
      'redirected': redirected,
      'total': total,
    };
  }

  @override
  String toString() {
    return 'Calls(missed: $missed, inTime: $inTime, avgTalkTime: $avgTalkTime, sumTalkTime: $sumTalkTime, avgWaitTime: $avgWaitTime, accepted: $accepted, redirected: $redirected, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Calls &&
        other.missed == missed &&
        other.inTime == inTime &&
        other.avgTalkTime == avgTalkTime &&
        other.sumTalkTime == sumTalkTime &&
        other.avgWaitTime == avgWaitTime &&
        other.accepted == accepted &&
        other.redirected == redirected &&
        other.total == total;
  }

  @override
  int get hashCode {
    return missed.hashCode ^
        inTime.hashCode ^
        avgTalkTime.hashCode ^
        sumTalkTime.hashCode ^
        avgWaitTime.hashCode ^
        accepted.hashCode ^
        redirected.hashCode ^
        total.hashCode;
  }
}

class PerformanceModel {
  final AverageRating averageRating;
  final DistinctRatings distinctRatings;
  final Calls calls;
  final bool success;
  final String staticHostName;

  PerformanceModel({
    required this.averageRating,
    required this.distinctRatings,
    required this.calls,
    required this.success,
    required this.staticHostName,
  });

  factory PerformanceModel.fromJson(Map<String, dynamic> json) {
    return PerformanceModel(
      averageRating: AverageRating.fromJson(json['average_rating']),
      distinctRatings: DistinctRatings.fromJson(json['distinct_ratings']),
      calls: Calls.fromJson(json['calls']),
      success: json['_success'],
      staticHostName: json['static_host_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'average_rating': averageRating.toJson(),
      'distinct_ratings': distinctRatings.toJson(),
      'calls': calls.toJson(),
      '_success': success,
      'static_host_name': staticHostName,
    };
  }

  @override
  String toString() {
    return 'PerformanceModel(averageRating: $averageRating, distinctRatings: $distinctRatings, calls: $calls, success: $success, staticHostName: $staticHostName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PerformanceModel &&
        other.averageRating == averageRating &&
        other.distinctRatings == distinctRatings &&
        other.calls == calls &&
        other.success == success &&
        other.staticHostName == staticHostName;
  }

  @override
  int get hashCode {
    return averageRating.hashCode ^
        distinctRatings.hashCode ^
        calls.hashCode ^
        success.hashCode ^
        staticHostName.hashCode;
  }
}
