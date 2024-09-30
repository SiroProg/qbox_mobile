class SlaConfigs {
  String? regexp;

  SlaConfigs({this.regexp});

  factory SlaConfigs.fromJson(Map<String, dynamic> json) {
    return SlaConfigs(
      regexp: json['regexp'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'regexp': regexp};
}
