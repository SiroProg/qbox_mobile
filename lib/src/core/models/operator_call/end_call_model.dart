class EndCallModel {
  EndCallModel({
    this.chat,
    this.nonresidentVerificationStatus,
    this.userTreatmentType,
    this.userPostMistake,
    this.userClientType,
    this.comment,
    this.taskTypeId,
    this.clientSender,
  });

  String? chat;
  int? taskTypeId;
  int? nonresidentVerificationStatus;
  int? userTreatmentType;
  int? userPostMistake;
  int? userClientType;
  String? comment;
  String? clientSender;

  Map<String, Object?> toJson() => <String, Object?>{
        'chat': chat,
        'taskTypeId': taskTypeId,
        'nonresidentVerificationStatus': nonresidentVerificationStatus,
        'userTreatmentType': userTreatmentType,
        'userPostMistake': userPostMistake,
        'userClientType': userClientType,
        'comment': comment,
        'clientSender': 'user:id:$clientSender',
      };

  @override
  bool operator ==(covariant EndCallModel other) {
    if (identical(this, other)) return true;

    return other.chat == chat &&
        other.taskTypeId == taskTypeId &&
        other.nonresidentVerificationStatus == nonresidentVerificationStatus &&
        other.userTreatmentType == userTreatmentType &&
        other.userPostMistake == userPostMistake &&
        other.userClientType == userClientType &&
        other.comment == comment &&
        other.clientSender == clientSender;
  }

  @override
  int get hashCode =>
      chat.hashCode ^
      taskTypeId.hashCode ^
      nonresidentVerificationStatus.hashCode ^
      userTreatmentType.hashCode ^
      userPostMistake.hashCode ^
      userClientType.hashCode ^
      comment.hashCode ^
      clientSender.hashCode;

  EndCallModel copyWith({
    String? chat,
    int? taskTypeId,
    int? nonresidentVerificationStatus,
    int? userTreatmentType,
    int? userPostMistake,
    int? userClientType,
    String? comment,
    String? clientSender,
  }) =>
      EndCallModel(
        chat: chat ?? this.chat,
        taskTypeId: taskTypeId ?? this.taskTypeId,
        nonresidentVerificationStatus:
            nonresidentVerificationStatus ?? this.nonresidentVerificationStatus,
        userTreatmentType: userTreatmentType ?? this.userTreatmentType,
        userPostMistake: userPostMistake ?? this.userPostMistake,
        userClientType: userClientType ?? this.userClientType,
        comment: comment ?? this.comment,
        clientSender: clientSender ?? this.clientSender,
      );

  @override
  String toString() => 'EndCallModel('
      'chat: $chat,'
      'taskTypeId: $taskTypeId,'
      'nonresidentVerificationStatus: $nonresidentVerificationStatus,'
      'userTreatmentType: $userTreatmentType,'
      'userPostMistake: $userPostMistake,'
      'userClientType: $userClientType,'
      'comment: $comment,'
      'clientSender: $clientSender)';
}
