
// Модель для очереди (Queue)
class Queue {
  final int id;
  final String title;

  Queue({required this.id, required this.title});

  factory Queue.fromJson(Map<String, dynamic> json) {
    return Queue(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  String toString() => 'Queue(id: $id, title: $title)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Queue &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}

// Модель для причины (Reason)
class Reason {
  final int id;
  final String title;

  Reason({required this.id, required this.title});

  factory Reason.fromJson(Map<String, dynamic> json) {
    return Reason(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }

  @override
  String toString() => 'Reason(id: $id, title: $title)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Reason &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;
}

// Модель для деталей (Details)
class Details {
  final int? userPostMistake;
  final int? userTreatmentType;
  final int? nonresidentVerificationStatus;

  Details({
    this.userPostMistake,
    this.userTreatmentType,
    this.nonresidentVerificationStatus,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      userPostMistake: json['user_post_mistake'] as int?,
      userTreatmentType: json['user_treatment_type'] as int?,
      nonresidentVerificationStatus: json['nonresident_verification_status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_post_mistake': userPostMistake,
      'user_treatment_type': userTreatmentType,
      'nonresident_verification_status': nonresidentVerificationStatus,
    };
  }

  @override
  String toString() =>
      'Details(userPostMistake: $userPostMistake, userTreatmentType: $userTreatmentType, nonresidentVerificationStatus: $nonresidentVerificationStatus)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Details &&
              runtimeType == other.runtimeType &&
              userPostMistake == other.userPostMistake &&
              userTreatmentType == other.userTreatmentType &&
              nonresidentVerificationStatus == other.nonresidentVerificationStatus;

  @override
  int get hashCode =>
      userPostMistake.hashCode ^
      userTreatmentType.hashCode ^
      nonresidentVerificationStatus.hashCode;
}

// Модель для обратной связи (Feedback)
class Feedback {
  final int rating;

  Feedback({required this.rating});

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      rating: json['rating'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
    };
  }

  @override
  String toString() => 'Feedback(rating: $rating)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Feedback &&
              runtimeType == other.runtimeType &&
              rating == other.rating;

  @override
  int get hashCode => rating.hashCode;
}

// Модель для клиента (Customer)
class Customer {
  final int id;
  final String firstName;
  final String lastName;
  final String patronymic;

  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      patronymic: json['patronymic'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'patronymic': patronymic,
    };
  }

  @override
  String toString() {
    return 'Customer{id: $id, firstName: $firstName, lastName: $lastName, patronymic: $patronymic}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Customer) return false;
    return id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        patronymic == other.patronymic;
  }

  @override
  int get hashCode =>
      id.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ patronymic.hashCode;
}

// Модель для разговора (Conversation)
class ConversationModel {
  final int id;
  final Customer? customer;
  final String channel;
  final Queue queue;
  final int startedAt;
  final int duration;
  final Reason? reason;
  final Details? details;
  final String? comment;
  final Feedback feedback;

  ConversationModel({
    required this.id,
    required this.customer,
    required this.channel,
    required this.queue,
    required this.startedAt,
    required this.duration,
    this.reason,
    this.details,
    this.comment,
    required this.feedback,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['id'] as int,
      customer: Customer.fromJson(json['customer']),
      channel: json['channel'] as String,
      queue: Queue.fromJson(json['queue']),
      startedAt: json['started_at'] as int,
      duration: json['duration'] as int,
      reason: json['reason'] != null ? Reason.fromJson(json['reason']) : null,
      details: json['details'] != null ? Details.fromJson(json['details']) : null,
      comment: json['comment'] as String?,
      feedback: Feedback.fromJson(json['feedback']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer': customer?.toJson(),
      'channel': channel,
      'queue': queue.toJson(),
      'started_at': startedAt,
      'duration': duration,
      'reason': reason?.toJson(),
      'details': details?.toJson(),
      'comment': comment,
      'feedback': feedback.toJson(),
    };
  }

  @override
  String toString() {
    return 'Conversation(id: $id, customer: $customer, channel: $channel, queue: $queue, startedAt: $startedAt, duration: $duration, reason: $reason, details: $details, comment: $comment, feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ConversationModel &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              customer == other.customer &&
              channel == other.channel &&
              queue == other.queue &&
              startedAt == other.startedAt &&
              duration == other.duration &&
              reason == other.reason &&
              details == other.details &&
              comment == other.comment &&
              feedback == other.feedback;

  @override
  int get hashCode =>
      id.hashCode ^
      customer.hashCode ^
      channel.hashCode ^
      queue.hashCode ^
      startedAt.hashCode ^
      duration.hashCode ^
      reason.hashCode ^
      details.hashCode ^
      comment.hashCode ^
      feedback.hashCode;
}
