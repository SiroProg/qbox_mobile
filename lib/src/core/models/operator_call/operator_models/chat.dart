class Chat {
  final String message;
  final String senderToken;
  final DateTime time;
  final String? fileName;
  final double? size;

  const Chat({
    required this.time,
    required this.message,
    required this.senderToken,
    this.fileName,
    this.size,
  });

  @override
  bool operator ==(covariant Chat other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.senderToken == senderToken &&
        other.time.millisecondsSinceEpoch == time.millisecondsSinceEpoch &&
        other.fileName == fileName &&
        other.size == size;
  }

  @override
  int get hashCode =>
      message.hashCode ^
      senderToken.hashCode ^
      time.millisecondsSinceEpoch.hashCode ^
      fileName.hashCode ^
      size.hashCode;

  @override
  String toString() {
    return 'Chat(message: $message, senderToken: $senderToken, time: $time, fileName: $fileName, size: $size)';
  }
}
