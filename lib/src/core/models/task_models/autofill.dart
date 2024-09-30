class Autofill {
  String? qualifier;

  Autofill({this.qualifier});

  factory Autofill.fromJson(Map<String, dynamic> json) {
    return Autofill(
      qualifier: json['qualifier'],
    );
  }

  Map<String, dynamic> toJson() => {'qualifier': qualifier};
}
