import 'package:qbox_mobile/src/core/constants/api_constants.dart';

class UserModel {
  const UserModel({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.status,
    required this.photo,
  });

  final int id;
  final String fullName;
  final String userName;
  final String status;
  final String photo;

  factory UserModel.fromJson(Map<String, Object?> json) => UserModel(
        id: json['id'] as int,
        fullName: json['fullname'] as String,
        userName: json['username'] as String,
        photo: "${ApiConstants.baseUrl}${(json['photo'] as String? ?? "")}",
        status: (json['status'] as int) == 1 ? 'Active' : 'Deleted',
      );

  @override
  String toString() => 'UserModel('
      'id: $id,'
      'fullName: $fullName,'
      'userName: $userName,'
      'status: $status)';
}
