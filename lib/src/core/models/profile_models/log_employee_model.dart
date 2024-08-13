
class LogEmployeeModel {
  int? id;
  String? photo;
  String? sipId;
  String? username;
  String? lastName;
  String? firstName;
  String? patronymic;
  String? displayName;

  LogEmployeeModel({
    this.id,
    this.photo,
    this.sipId,
    this.username,
    this.lastName,
    this.firstName,
    this.patronymic,
    this.displayName,
  });

  factory LogEmployeeModel.fromJson(Map<String, dynamic> json) {
    return LogEmployeeModel(
      id: json['id'] as int?,
      photo: json['photo'] as String?,
      sipId: json['sip_id'] as String?,
      username: json['username'] as String?,
      lastName: json['last_name'] as String?,
      firstName: json['first_name'] as String?,
      patronymic: json['patronymic'] as String?,
      displayName: json['display_name'] as String?,
    );
  }
}
