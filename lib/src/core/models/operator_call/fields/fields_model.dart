import 'auto_fill_model.dart';
import 'configs_model.dart';

class FormFieldModel {
  FormFieldModel({
    required this.id,
    required this.title,
    required this.prompt,
    required this.type,
    this.defaultValue,
    required this.formId,
    this.configs,
    required this.position,
    this.keyboard,
    required this.required,
    this.autofill,
    this.conditions,
    this.errors,
    this.ttl,
    required this.status,
    this.placeholder,
    required this.change,
    required this.level,
    this.value,
  });

  final int id;
  final String? title;
  final String? prompt;
  final String? type;
  final String? defaultValue;
  final int formId;
  final ConfigsModel? configs;
  final int position;
  final Map<String, dynamic>? keyboard;
  final bool required;
  final AutofillModel? autofill;
  final dynamic conditions;
  final dynamic errors;
  final dynamic ttl;
  final int status;
  final String? placeholder;
  final bool change;
  final int level;
  dynamic value;

  factory FormFieldModel.fromJson(Map<String, dynamic> json) => FormFieldModel(
        id: json['id'],
        title: json['title'],
        prompt: json['prompt'],
        type: json['type'],
        defaultValue: json['default'],
        formId: json['form_id'],
        configs: json['configs'] != null
            ? ConfigsModel.fromJson(json['configs'])
            : null,
        position: json['position'],
        keyboard: json['keyboard'],
        required: json['required'],
        autofill: json['autofill'] != null
            ? AutofillModel.fromJson(json['autofill'])
            : null,
        conditions: json['conditions'],
        errors: json['errors'],
        ttl: json['ttl'],
        status: json['status'],
        placeholder: json['placeholder'],
        change: json['change'],
        level: json['level'],
        value: null,
      );

  Map<String, Object?> toJson() => <String, Object?>{
        'id': id,
        'title': title,
        'prompt': prompt,
        'type': type,
        'default': defaultValue,
        'form_id': formId,
        'configs': configs?.toJson(),
        'autofill': autofill?.toJson(),
        'change': change,
        'conditions': conditions,
        'errors': errors,
        'keyboard': keyboard,
        'level': level,
        'placeholder': placeholder,
        'position': position,
        'required': required,
        'status': status,
        'ttl': ttl,
        'value': value,
      };

  @override
  String toString() => 'FormFieldModel('
      'id: $id,'
      'title: $title,'
      'prompt: $prompt,'
      'type: $type,'
      'defaultValue: $defaultValue,'
      'formId: $formId,'
      'configs: $configs,'
      'position: $position,'
      'skeyboard: $keyboard,'
      'required: $required,'
      'autofill: $autofill,'
      'conditions: $conditions,'
      'errors: $errors,'
      'ttl: $ttl,'
      'status: $status,'
      'placeholder: $placeholder,'
      'schange: $change,'
      'level: $level'
      'value: $value)';
}
