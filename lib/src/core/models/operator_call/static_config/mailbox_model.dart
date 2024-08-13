class MailboxModel {
  const MailboxModel({
    required this.mail,
    required this.title,
  });

  final String mail;
  final String title;

  factory MailboxModel.fromJson(Map<String, Object?> json) => MailboxModel(
        mail: json['mail'] as String,
        title: json['title'] as String,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'mail': mail,
        'title': title,
      };

  @override
  bool operator ==(covariant MailboxModel other) {
    if (identical(this, other)) return true;

    return other.mail == mail && other.title == title;
  }

  @override
  int get hashCode => mail.hashCode ^ title.hashCode;

  MailboxModel copyWith({
    String? mail,
    String? title,
  }) =>
      MailboxModel(
        mail: mail ?? this.mail,
        title: title ?? this.title,
      );

  @override
  String toString() => 'MailboxModel(mail: $mail, title: $title)';
}
