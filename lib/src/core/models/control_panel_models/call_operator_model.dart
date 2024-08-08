class CallOperatorModel {
  final int id;
  final String fullName;
  final String address;
  final String session;
  final List<String> media;
  final String status;
  final int? teamId;
  final String? teamTitle;

  CallOperatorModel({
    required this.id,
    required this.fullName,
    required this.address,
    required this.session,
    required this.media,
    required this.status,
    this.teamId,
    this.teamTitle,
  });

  factory CallOperatorModel.fromJson(Map<String, dynamic> json) {
    return CallOperatorModel(
      id: json['id'],
      fullName: json['full_name'],
      address: json['address'],
      session: json['session'],
      media: List<String>.from(json['media']),
      status: json['status'],
      teamId: json['team_id'],
      teamTitle: json['team_title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'address': address,
      'session': session,
      'media': media,
      'status': status,
      'team_id': teamId,
      'team_title': teamTitle,
    };
  }
}