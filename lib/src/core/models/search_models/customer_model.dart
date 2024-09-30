import 'package:qbox_mobile/src/core/constants/api_constants.dart';

class CustomerModel {
  const CustomerModel({
    required this.id,
    required this.firstName,
    required this.photo,
    required this.phone,
  });

  final int id;
  final String firstName;
  final String photo;
  final String phone;

  factory CustomerModel.fromJson(Map<String, Object?> json) => CustomerModel(
        id: json['id'] as int,
        firstName: json['first_name'] as String? ?? 'no name',
        photo: "${ApiConstants.baseUrl}${(json['photo'] as String? ?? '')}",
        phone: (json['contacts'] as Map<String, Object?>)['sip'] as String? ??
            json['email'] as String? ??
            json['iin'] as String? ??
            'null',
      );

  @override
  String toString() => 'CustomerModel('
      'id: $id,'
      'firstName: $firstName,'
      'photo: $photo,'
      'phone: $phone)';
}
