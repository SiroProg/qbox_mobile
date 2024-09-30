class Url {
  String? full;
  String? short;

  Url({
    this.full,
    this.short,
  });

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      full: json['full'],
      short: json['short'],
    );
  }

  Map<String, dynamic> toJson() => {
        'full': full,
        'short': short,
      };
}
