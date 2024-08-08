
import 'locale_model.dart';
import 'notifications_model.dart';
import 'role_model.dart';
import 'team_model.dart';

class Employee {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String? patronymic;
  final String? photo;
  final String? iin;
  final int? sex;
  final LocaleEmployee locale;
  final int? management;
  final int? position;
  final Role role;
  final Team team;
  final Notifications notifications;
  final List<String> scopes;
  final String? timezone;

  Employee({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    this.patronymic,
    this.photo,
    this.iin,
    this.sex,
    required this.locale,
    this.management,
    this.position,
    required this.role,
    required this.team,
    required this.notifications,
    required this.scopes,
    this.timezone,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] as int? ?? 1,
      username: json['username'] as String? ?? "",
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      patronymic: json['patronymic'] as String?,
      photo: json['photo'] as String?,
      iin: json['iin'] as String?,
      sex: json['sex'] as int?,
      locale: LocaleEmployee.fromJson(json['locale']),
      management: json['management'] as int?,
      position: json['position'] as int?,
      role: Role.fromJson(json['role']),
      team: Team.fromJson(json['team']),
      notifications: Notifications.fromJson(json['notifications']),
      scopes: List<String>.from(json['scopes']),
      timezone: json['timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'patronymic': patronymic,
      'photo': photo,
      'iin': iin,
      'sex': sex,
      'locale': locale.toJson(),
      'management': management,
      'position': position,
      'role': role.toJson(),
      'team': team.toJson(),
      'notifications': notifications.toJson(),
      'scopes': scopes,
      'timezone': timezone,
    };
  }

  @override
  String toString() {
    return 'Employee{id: $id, username: $username, firstName: $firstName, lastName: $lastName, '
        'patronymic: $patronymic, photo: $photo, iin: $iin, sex: $sex, locale: $locale, '
        'management: $management, position: $position, role: $role, team: $team, '
        'notifications: $notifications, scopes: $scopes, timezone: $timezone}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Employee &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              username == other.username &&
              firstName == other.firstName &&
              lastName == other.lastName &&
              patronymic == other.patronymic &&
              photo == other.photo &&
              iin == other.iin &&
              sex == other.sex &&
              locale == other.locale &&
              management == other.management &&
              position == other.position &&
              role == other.role &&
              team == other.team &&
              notifications == other.notifications &&
              scopes == other.scopes &&
              timezone == other.timezone;

  @override
  int get hashCode =>
      id.hashCode ^
      username.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      patronymic.hashCode ^
      photo.hashCode ^
      iin.hashCode ^
      sex.hashCode ^
      locale.hashCode ^
      management.hashCode ^
      position.hashCode ^
      role.hashCode ^
      team.hashCode ^
      notifications.hashCode ^
      scopes.hashCode ^
      timezone.hashCode;
}