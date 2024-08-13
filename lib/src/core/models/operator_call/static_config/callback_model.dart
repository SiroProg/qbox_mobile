import 'call_model.dart';

class CallbackModel {
  const CallbackModel({
    required this.call,
    required this.isEnabled,
  });

  final CallModel call;
  final bool isEnabled;

  factory CallbackModel.fromJson(Map<String, Object?> json) => CallbackModel(
        call: CallModel.fromJson(json['call'] as Map<String, Object?>),
        isEnabled: json['is_enabled'] as bool,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'call': call.toJson(),
        'is_enabled': isEnabled,
      };

  @override
  bool operator ==(covariant CallbackModel other) {
    if (identical(this, other)) return true;

    return other.call == call && other.isEnabled == isEnabled;
  }

  @override
  int get hashCode => call.hashCode ^ isEnabled.hashCode;

  CallbackModel copyWith({
    CallModel? call,
    bool? isEnabled,
  }) =>
      CallbackModel(
        call: call ?? this.call,
        isEnabled: isEnabled ?? this.isEnabled,
      );

  @override
  String toString() => 'CallbackModel(call: $call, isEnabled: $isEnabled)';
}
