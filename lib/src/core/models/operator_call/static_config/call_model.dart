class CallModel {
  const CallModel({required this.isEnabled});

  final bool isEnabled;

  factory CallModel.fromJson(Map<String, Object?> json) => CallModel(
        isEnabled: json['is_enabled'] as bool,
      );

  Map<String, Object?> toJson() => <String, Object?>{'is_enabled': isEnabled};

  @override
  bool operator ==(covariant CallModel other) {
    if (identical(this, other)) return true;

    return other.isEnabled == isEnabled;
  }

  @override
  int get hashCode => isEnabled.hashCode;

  CallModel copyWith({
    bool? isEnabled,
  }) =>
      CallModel(
        isEnabled: isEnabled ?? this.isEnabled,
      );

  @override
  String toString() => 'CallModel(isEnabled: $isEnabled)';
}
