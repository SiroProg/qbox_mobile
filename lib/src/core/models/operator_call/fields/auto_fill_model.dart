class AutofillModel {
  const AutofillModel({required this.qualifier});

  final String? qualifier;

  factory AutofillModel.fromJson(Map<String, dynamic> json) =>
      AutofillModel(qualifier: json['qualifier']);

  Map<String, Object?> toJson() => <String, Object?>{'qualifier': qualifier};

  @override
  String toString() => 'AutofillModel(qualifier: $qualifier)';
}
