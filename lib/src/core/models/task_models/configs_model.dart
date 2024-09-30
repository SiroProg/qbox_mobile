import 'message.dart';
import 'refs_data.dart';
import 'sla_form_data.dart';

class Configs {
  int? order;
  String? sender;
  int? formId;
  List<dynamic>? mentions;
  List<Message?>? messages;
  int? clientId;
  int? formData;
  RefsData? refsData;
  List<SlaFormData>? slaFormData;

  Configs({
    this.order,
    this.sender,
    this.formId,
    this.mentions,
    this.messages,
    this.clientId,
    this.formData,
    this.refsData,
    this.slaFormData,
  });

  factory Configs.fromJson(Map<String, dynamic> json) {
    return Configs(
      order: json['order'],
      sender: json['sender'],
      formId: json['form_id'],
      mentions: List<dynamic>.from(json['mentions']),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e))
          .toList(),
      clientId: json['client_id'],
      formData: json['form_data'],
      refsData: RefsData.fromJson(json['refs_data']),
      slaFormData: (json['sla_form_data'] as List<dynamic>)
          .map((e) => SlaFormData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order': order,
      'sender': sender,
      'form_id': formId,
      'mentions': mentions,
      'messages': messages?.map((e) => e?.toJson()).toList(),
      'client_id': clientId,
      'form_data': formData,
      'refs_data': refsData?.toJson(),
      'sla_form_data': slaFormData?.map((e) => e.toJson()).toList(),
    };
  }
}
