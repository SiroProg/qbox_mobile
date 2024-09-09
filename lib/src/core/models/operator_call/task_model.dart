class TaskModel {
  const TaskModel({
    required this.formId,
    required this.fullName,
    required this.iin,
    required this.email,
    required this.phoneNumber,
  });

  final int formId;
  final String fullName;
  final String iin;
  final String email;
  final String phoneNumber;

  Map<String, Object?> toJson() => <String, Object?>{
        'form_id': formId,
        'full_name': fullName,
        'iin': iin,
        'email': email,
        'phone_number': phoneNumber,
      };

  factory TaskModel.fromJson(Map<String, Object?> json) => TaskModel(
        formId: json['form_id'] as int,
        fullName: json['full_name'] as String,
        iin: json['iin'] as String,
        email: json['email'] as String,
        phoneNumber: json['phone_number'] as String,
      );

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.formId == formId &&
        other.fullName == fullName &&
        other.iin == iin &&
        other.email == email &&
        other.phoneNumber == phoneNumber;
  }

  @override
  int get hashCode =>
      formId.hashCode ^
      fullName.hashCode ^
      iin.hashCode ^
      email.hashCode ^
      phoneNumber.hashCode;

  TaskModel copyWith({
    int? formId,
    String? fullName,
    String? iin,
    String? email,
    String? phoneNumber,
  }) =>
      TaskModel(
        formId: formId ?? this.formId,
        fullName: fullName ?? this.fullName,
        iin: iin ?? this.iin,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
      );

  @override
  String toString() => 'TaskModel('
      'formId: $formId,'
      'fullName: $fullName,'
      'iin: $iin,'
      'email: $email,'
      'phoneNumber: $phoneNumber)';
}
