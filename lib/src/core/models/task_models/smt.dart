class Stm {
  const Stm({required this.isInitiated});

  final bool? isInitiated;

  factory Stm.fromJson(Map<String, dynamic> json) => Stm(
        isInitiated: json['is_initiated'],
      );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'isInitiated': isInitiated};

  @override
  String toString() => 'Stm(isInitiated: $isInitiated)';
}
