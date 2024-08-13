class RegionModel {
  const RegionModel({
    required this.region,
    required this.title,
  });

  final String region;
  final String title;

  factory RegionModel.fromJson(Map<String, Object?> json) => RegionModel(
        region: json['region'] as String,
        title: json['title'] as String,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'region': region,
        'title': title,
      };

  @override
  bool operator ==(covariant RegionModel other) {
    if (identical(this, other)) return true;

    return other.region == region && other.title == title;
  }

  @override
  int get hashCode => region.hashCode ^ title.hashCode;

  RegionModel copyWith({
    String? region,
    String? title,
  }) =>
      RegionModel(
        region: region ?? this.region,
        title: title ?? this.title,
      );

  @override
  String toString() => 'RegionModel(region: $region, title: $title)';
}
