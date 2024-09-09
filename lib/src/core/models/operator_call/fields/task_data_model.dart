import 'fields_model.dart';

class TaskDataModel {
  const TaskDataModel({
    this.callReasonId,
    this.channel = 'ws',
    required this.formData,
    required this.formId,
    this.lines = const [],
    this.location = const [],
    this.refsData = const {},
    this.requestType = 'sla',
    required this.sender,
  });

  final int? callReasonId;
  final String? channel;
  final List<FormFieldModel> formData;
  final List lines;
  final int formId;
  final List location;
  final Map<String, Object?> refsData;
  final String requestType;
  final String sender;

  Map<String, Object?> toJson() => <String, Object?>{
        'call_reason_id': callReasonId,
        'channel': channel,
        'form_data': formData.map((x) => x.toJson()).toList(),
        'form_id': formId,
        'lines': lines,
        'location': location,
        'refs_data': refsData,
        'request_type': requestType,
        'sender': 'user:id:$sender',
      };

  @override
  String toString() => 'TaskModel('
      'callReasonId: $callReasonId,'
      'channel: $channel,'
      'formData: $formData,'
      'lines: $lines,'
      'formId: $formId,'
      'location: $location,'
      'refsData: $refsData,'
      'requestType: $requestType,'
      'sender: $sender)';
}
