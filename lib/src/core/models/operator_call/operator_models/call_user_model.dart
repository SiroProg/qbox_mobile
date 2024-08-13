class CallUserModel {
  const CallUserModel({
    required this.channel,
    required this.queue,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.iin,
    required this.phone,
    required this.lang,
  });

  final String channel;
  final String queue;
  final String userId;
  final String firstName;
  final String lastName;
  final String? photo;
  final String? iin;
  final String? phone;
  final String lang;

  factory CallUserModel.fromJson(Map<String, dynamic> json) {
    final extra = json['extra'] ?? {};
    return CallUserModel(
      channel: json['channel'] as String? ?? '',
      queue: json['queue'] as String? ?? '',
      userId: json['customer_id'].toString(),
      firstName: extra['first_name'] as String? ?? '',
      lastName: extra['last_name'] as String? ?? '',
      photo: extra['photo'] as String?,
      iin: extra['iin'] as String?,
      phone: extra['phone'] as String?,
      lang: json['lang'] as String? ?? '',
    );
  }
  @override
  bool operator ==(covariant CallUserModel other) {
    if (identical(this, other)) return true;

    return other.channel == channel &&
        other.queue == queue &&
        other.userId == userId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.photo == photo &&
        other.iin == iin &&
        other.phone == phone &&
        other.lang == lang;
  }

  @override
  int get hashCode =>
      channel.hashCode ^
      queue.hashCode ^
      userId.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      photo.hashCode ^
      iin.hashCode ^
      phone.hashCode ^
      lang.hashCode;

  CallUserModel copyWith({
    String? channel,
    String? queue,
    String? userId,
    String? firstName,
    String? lastName,
    String? photo,
    String? iin,
    String? phone,
    String? lang,
  }) =>
      CallUserModel(
        channel: channel ?? this.channel,
        queue: queue ?? this.queue,
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        photo: photo ?? this.photo,
        iin: iin ?? this.iin,
        phone: phone ?? this.phone,
        lang: lang ?? this.lang,
      );

  @override
  String toString() => 'CallUserModel('
      'channel: $channel,'
      'queue: $queue,'
      'userId: $userId,'
      'firstName: $firstName,'
      'lastName: $lastName,'
      'photo: $photo,'
      'iin: $iin,'
      'phone: $phone'
      'lang: $lang)';
}
