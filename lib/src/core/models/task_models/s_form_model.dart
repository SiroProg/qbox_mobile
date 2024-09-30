class SForm {
  int? formId;
  String? formTitle;
  int? datetime;
  FormData? data;

  SForm({
    required this.formId,
    required this.formTitle,
    required this.datetime,
    required this.data,
  });

  factory SForm.fromJson(Map<String, dynamic> json) {
    return SForm(
      formId: json['form_id'],
      formTitle: json['form_title'],
      datetime: json['datetime'],
      data: FormData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'form_id': formId,
      'form_title': formTitle,
      'datetime': datetime,
      'data': data?.toJson(),
    };
  }
}

// FormData Model
class FormData {
  List<dynamic> nodes;
  Fields fields;

  FormData({
    required this.nodes,
    required this.fields,
  });

  factory FormData.fromJson(Map<String, dynamic> json) {
    return FormData(
      nodes: List<dynamic>.from(json['nodes']),
      fields: Fields.fromJson(json['fields']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nodes': nodes,
      'fields': fields.toJson(),
    };
  }
}

// Fields Model
class Fields {
  FieldData iin;
  FieldData fullName;
  FieldData applicantNumber;
  FieldData email;

  Fields({
    required this.iin,
    required this.fullName,
    required this.applicantNumber,
    required this.email,
  });

  factory Fields.fromJson(Map<String, dynamic> json) {
    return Fields(
      iin: FieldData.fromJson(json['ИИН']),
      fullName: FieldData.fromJson(json['ФИО']),
      applicantNumber: FieldData.fromJson(json['Номер заявителя']),
      email: FieldData.fromJson(json['Электронная почта']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ИИН': iin.toJson(),
      'ФИО': fullName.toJson(),
      'Номер заявителя': applicantNumber.toJson(),
      'Электронная почта': email.toJson(),
    };
  }
}

// FieldData Model
class FieldData {
  String? text;
  FieldDetails details;

  FieldData({
    this.text,
    required this.details,
  });

  factory FieldData.fromJson(Map<String, dynamic> json) {
    return FieldData(
      text: json['text'],
      details: FieldDetails.fromJson(json['details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'details': details.toJson(),
    };
  }
}

// FieldDetails Model
class FieldDetails {
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
  Map<String, dynamic>? configs;
  dynamic defaultValue;
  int? formId;
  Autofill? autofill;
  dynamic keyboard;
  int? position;
  bool? required;
  dynamic conditions;
  dynamic placeholder;

  FieldDetails({
    required this.id,
    this.ttl,
    required this.type,
    required this.level,
    required this.title,
    this.value,
    required this.change,
    this.errors,
    required this.prompt,
    required this.status,
    this.configs,
    this.defaultValue,
    required this.formId,
    required this.autofill,
    this.keyboard,
    required this.position,
    required this.required,
    this.conditions,
    this.placeholder,
  });

  factory FieldDetails.fromJson(Map<String, dynamic> json) {
    return FieldDetails(
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
      configs: json['configs'] != null
          ? Map<String, dynamic>.from(json['configs'])
          : null,
      defaultValue: json['default'],
      formId: json['form_id'],
      autofill: Autofill.fromJson(json['autofill']),
      keyboard: json['keyboard'],
      position: json['position'],
      required: json['required'],
      conditions: json['conditions'],
      placeholder: json['placeholder'],
    );
  }

  Map<String, dynamic> toJson() => {
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
        'configs': configs,
        'default': defaultValue,
        'form_id': formId,
        'autofill': autofill?.toJson(),
        'keyboard': keyboard,
        'position': position,
        'required': required,
        'conditions': conditions,
        'placeholder': placeholder,
      };
}

class Autofill {
  String? qualifier;

  Autofill({
    required this.qualifier,
  });

  factory Autofill.fromJson(Map<String, dynamic> json) {
    return Autofill(
      qualifier: json['qualifier'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'qualifier': qualifier,
    };
  }
}
