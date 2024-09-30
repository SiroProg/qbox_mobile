import 's_form_model.dart';
import 'sla_configs.dart';

class SlaFormData {
  int? id;
  String? ttl;
  String? type;
  int? level;
  String? title;
  String? value;
  bool? change;
  dynamic errors;
  String? prompt;
  int? status;
  SlaConfigs? configs;
  dynamic def;
  int? formId;
  Autofill? autofill;
  dynamic keyboard;
  int? position;
  bool? required;
  dynamic conditions;
  dynamic placeholder;

  SlaFormData({
    this.id,
    this.ttl,
    this.type,
    this.level,
    this.title,
    this.value,
    this.change,
    this.errors,
    this.prompt,
    this.status,
    this.configs,
    this.def,
    this.formId,
    this.autofill,
    this.keyboard,
    this.position,
    this.required,
    this.conditions,
    this.placeholder,
  });

  factory SlaFormData.fromJson(Map<String, dynamic> json) {
    return SlaFormData(
      id: json['id'],
      ttl: json['ttl'],
      type: json['type'],
      level: json['level'],
      title: json['title'],
      value: json['value'],
      change: json['change'],
      errors: json['errors'],
      prompt: json['prompt'],
      status: json['status'],
      configs: SlaConfigs.fromJson(json['configs']),
      def: json['default'],
      formId: json['form_id'],
      autofill: Autofill.fromJson(json['autofill']),
      keyboard: json['keyboard'],
      position: json['position'],
      required: json['required'],
      conditions: json['conditions'],
      placeholder: json['placeholder'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ttl': ttl,
      'type': type,
      'level': level,
      'title': title,
      'value': value,
      'change': change,
      'errors': errors,
      'prompt': prompt,
      'status': status,
      'configs': configs?.toJson(),
      'default': def,
      'form_id': formId,
      'autofill': autofill?.toJson(),
      'keyboard': keyboard,
      'position': position,
      'required': required,
      'conditions': conditions,
      'placeholder': placeholder,
    };
  }
}
