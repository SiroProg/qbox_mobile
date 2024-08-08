

import '../auth_models/role_model.dart';
import 'group_model.dart';

class EmployeeByIdModel {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? patronymic;
  final String? username;
  final int? status;
  final int? sex;
  final String? iin;
  final String? photo;
  final int? permissions;
  final Role? role;
  final int? createdAt;
  final String? externalId;
  final GroupModel? group;
  final int? management;
  final dynamic position;
  final String? locale;
  final int? lastLogin;
  final CreatedByModel? createdBy;
  final BlockedByModel? blockedBy;
  final DeletedByModel? deletedBy;
  final String? timezone;

  EmployeeByIdModel({
    this.id,
    this.firstName,
    this.lastName,
    this.patronymic,
    this.username,
    this.status,
    this.sex,
    this.iin,
    this.photo,
    this.permissions,
    this.role,
    this.createdAt,
    this.externalId,
    this.group,
    this.management,
    this.position,
    this.locale,
    this.lastLogin,
    this.createdBy,
    this.blockedBy,
    this.deletedBy,
    this.timezone,
  });

  factory EmployeeByIdModel.fromJson(Map<String, dynamic> json) {
    return EmployeeByIdModel(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      patronymic: json['patronymic'] as String?,
      username: json['username'] as String?,
      status: json['status'] as int?,
      sex: json['sex'] as int?,
      iin: json['iin'] as String?,
      photo: json['photo'] as String?,
      permissions: json['permissions'] as int?,
      role: json['role'] != null
          ? Role.fromJson(json['role'] as Map<String, dynamic>)
          : null,
      createdAt: json['created_at'] as int?,
      externalId: json['external_id'] as String?,
      group: json['group'] != null ? GroupModel.fromJson(json['group'] as Map<String, dynamic>) : null,
      management: json['management'] as int? ?? -1,
      position: json['position'],
      locale: json['locale'] as String?,
      lastLogin: json['last_login'] as int?,
      createdBy: json['created_by'] != null
          ? CreatedByModel.fromJson(json['created_by'] as Map<String, dynamic>)
          : null,
      blockedBy: json['blocked_by'] != null
          ? BlockedByModel.fromJson(json['blocked_by'] as Map<String, dynamic>)
          : null,
      deletedBy: json['deleted_by'] != null
          ? DeletedByModel.fromJson(json['deleted_by'] as Map<String, dynamic>)
          : null,
      timezone: json['timezone'] as String?,
    );
  }
}
