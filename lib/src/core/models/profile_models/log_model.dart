import 'log_employee_model.dart';

class LogModel {
  LogEmployeeModel? employee;
  String? event;
  String? type;
  int? createdAt;
  dynamic old;
  dynamic newField;
  dynamic extra;
  dynamic state;
  dynamic duration;
  dynamic objectId;

  LogModel({
    this.employee,
    this.event,
    this.type,
    this.createdAt,
    this.old,
    this.newField,
    this.extra,
    this.state,
    this.duration,
    this.objectId,
  });

  factory LogModel.fromJson(Map<String, dynamic> json) {
    return LogModel(
      employee: json['employee'] != null ? LogEmployeeModel.fromJson(json['employee']) : null,
      event: json['event'] as String?,
      type: json['type'] as String?,
      createdAt: json['created_at'] as int?,
      old: json['old'],
      newField: json['new'],
      extra: json['extra'],
      state: json['state'],
      duration: json['duration'],
      objectId: json['object_id'],
    );
  }
}
