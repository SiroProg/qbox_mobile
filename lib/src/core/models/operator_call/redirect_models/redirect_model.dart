class RedirectModel {
  final int id;
  final String fullName;
  final String address;
  final String session;
  final List<String> media;
  final String status;
  final int? teamId;
  final String? teamTitle;

  RedirectModel({
    required this.id,
    required this.fullName,
    required this.address,
    required this.session,
    required this.media,
    required this.status,
    this.teamId,
    this.teamTitle,
  });

  factory RedirectModel.fromJson(Map<String, dynamic> json) {
    return RedirectModel(
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
}
