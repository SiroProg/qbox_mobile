import 'package:flutter/foundation.dart';
import 'role_model.dart';

class EmployeesModel {
  const EmployeesModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
    required this.displayName,
    required this.createdAt,
    required this.photo,
    required this.iin,
    required this.sipId,
    required this.callTypes,
    required this.lastLogin,
    required this.status,
    required this.role,
    required this.externalId,
  });

  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String? patronymic;
  final String displayName;
  final int createdAt;
  final String? photo;
  final String? iin;
  final String? sipId;
  final List<String?> callTypes;
  final int lastLogin;
  final int status;
  final Role role;
  final String? externalId;

  factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
        id: json['id'] as int,
        username: json['username'] as String? ?? 'No null',
        firstName: json['first_name'] as String? ?? 'No null',
        lastName: json['last_name'] as String? ?? 'No null',
        patronymic: json['patronymic'] as String?,
        displayName: json['display_name'] as String? ?? 'No null',
        createdAt: json['created_at'] != null ? json['created_at'] as int : 0,
        photo: json['photo'] as String?,
        iin: json['iin'] as String?,
        sipId: json['sip_id'] as String?,
        callTypes: List<String?>.from(json['call_types'] ?? []),
        lastLogin: json['last_login'] != null ? json['last_login'] as int : 0,
        status: json['status'] as int? ?? 0,
        role: Role.fromJson(json['role'] as Map<String, dynamic>),
        externalId: json['external_id'] as String?,
      );

  factory EmployeesModel.fromJson2(
          Map<String, dynamic> json, String roleTitle) =>
      EmployeesModel(
        id: json['id'] as int,
        username: json['username'] as String? ?? 'Null',
        firstName: json['first_name'] as String? ?? 'Null',
        lastName: json['last_name'] as String? ?? 'NUll',
        displayName: json['fullname'] as String? ?? 'NULL',
        photo: json['photo'] as String? ?? 'NULL',
        role: Role(id: json['role_id'], title: roleTitle),
        createdAt: 0,
        iin: '',
        patronymic: null,
        sipId: '',
        callTypes: [],
        lastLogin: 0,
        status: 0,
        externalId: '',
      );

  @override
  bool operator ==(covariant EmployeesModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.username == username &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.patronymic == patronymic &&
        other.displayName == displayName &&
        other.createdAt == createdAt &&
        other.photo == photo &&
        other.iin == iin &&
        other.sipId == sipId &&
        listEquals(other.callTypes, callTypes) &&
        other.lastLogin == lastLogin &&
        other.status == status &&
        other.role == role &&
        other.externalId == externalId;
  }

  @override
  int get hashCode =>
      id.hashCode ^
      username.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      patronymic.hashCode ^
      displayName.hashCode ^
      createdAt.hashCode ^
      photo.hashCode ^
      iin.hashCode ^
      sipId.hashCode ^
      callTypes.hashCode ^
      lastLogin.hashCode ^
      status.hashCode ^
      role.hashCode ^
      externalId.hashCode;

  EmployeesModel copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? patronymic,
    String? displayName,
    int? createdAt,
    String? photo,
    String? iin,
    String? sipId,
    List<String?>? callTypes,
    int? lastLogin,
    int? status,
    Role? role,
    String? externalId,
  }) =>
      EmployeesModel(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        patronymic: patronymic ?? this.patronymic,
        displayName: displayName ?? this.displayName,
        createdAt: createdAt ?? this.createdAt,
        photo: photo ?? this.photo,
        iin: iin ?? this.iin,
        sipId: sipId ?? this.sipId,
        callTypes: callTypes ?? this.callTypes,
        lastLogin: lastLogin ?? this.lastLogin,
        status: status ?? this.status,
        role: role ?? this.role,
        externalId: externalId ?? this.externalId,
      );

  @override
  String toString() => 'EmployeesModel('
      'id: $id,'
      'username: $username,'
      'firstName: $firstName,'
      'lastName: $lastName,'
      'patronymic: $patronymic,'
      'displayName: $displayName,'
      'createdAt: $createdAt,'
      'photo: $photo,'
      'iin: $iin,'
      'sipId: $sipId,'
      'callTypes: $callTypes,'
      'lastLogin: $lastLogin,'
      'status: $status,'
      'role: $role,'
      'externalId: $externalId)';
}
