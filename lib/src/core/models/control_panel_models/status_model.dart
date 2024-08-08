// Модель статуса
class Status {
  final int id;
  final String key;
  final String title;
  final Details details;
  final int status;
  final String type;
  final String? icon;

  Status({
    required this.id,
    required this.key,
    required this.title,
    required this.details,
    required this.status,
    required this.type,
    this.icon,
  });

// Десериализация
  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      key: json['key'],
      title: json['title'],
      details: Details.fromJson(json['details']),
      status: json['status'],
      type: json['type'],
      icon: json['icon'],
    );
  }

// Сериализация
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key': key,
      'title': title,
      'details': details.toJson(),
      'status': status,
      'type': type,
      'icon': icon,
    };
  }

// Метод для красивого отображения объекта в виде строки
  @override
  String toString() {
    return 'Status(id: $id, key: $key, title: $title, details: ${details.toString()}, status: $status, type: $type, icon: $icon)';
  }

// Метод для проверки равенства объектов
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Status &&
        other.id == id &&
        other.key == key &&
        other.title == title &&
        other.details == details &&
        other.status == status &&
        other.type == type &&
        other.icon == icon;
  }

// Метод для генерации хеш-кода объекта
  @override
  int get hashCode {
    return id.hashCode ^
        key.hashCode ^
        title.hashCode ^
        details.hashCode ^
        status.hashCode ^
        type.hashCode ^
        icon.hashCode;
  }

// Метод для создания копии объекта с возможностью изменения некоторых полей
  Status copyWith({
    int? id,
    String? key,
    String? title,
    Details? details,
    int? status,
    String? type,
    String? icon,
  }) {
    return Status(
      id: id ?? this.id,
      key: key ?? this.key,
      title: title ?? this.title,
      details: details ?? this.details,
      status: status ?? this.status,
      type: type ?? this.type,
      icon: icon ?? this.icon,
    );
  }
}

// Модель деталей
class Details {
  final bool show;
  final int? order;
  final int? duration;

  Details({
    required this.show,
    this.order,
    this.duration,
  });

  // Десериализация
  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      show: json['show'],
      order: json['order'],
      duration: json['duration'],
    );
  }

  // Сериализация
  Map<String, dynamic> toJson() {
    return {
      'show': show,
      'order': order,
      'duration': duration,
    };
  }
}
