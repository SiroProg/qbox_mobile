import 'values_model.dart';

class StaticModel {
  const StaticModel({
    required this.status,
    required this.entityType,
    required this.isThereAnyFaultOfSociety,
    required this.typeOfQuery,
  });

  final List<ValuesModel> status;
  final List<ValuesModel> entityType;
  final List<ValuesModel> isThereAnyFaultOfSociety;
  final List<ValuesModel> typeOfQuery;

  factory StaticModel.fromJson(Map<String, dynamic> json) => StaticModel(
        status: List<ValuesModel>.from(
          (json['rmo_appeal_reasons'][0]['values'] as List<dynamic>)
              .map<ValuesModel>(
            (x) => ValuesModel.fromJson(x as Map<String, dynamic>),
          ),
        ),
        typeOfQuery: List<ValuesModel>.from(
          (json['rmo_appeal_reasons'][1]['values'] as List<dynamic>)
              .map<ValuesModel>(
            (x) => ValuesModel.fromJson(x as Map<String, dynamic>),
          ),
        ),
        isThereAnyFaultOfSociety: List<ValuesModel>.from(
          (json['rmo_appeal_reasons'][2]['values'] as List<dynamic>)
              .map<ValuesModel>(
            (x) => ValuesModel.fromJson(x as Map<String, dynamic>),
          ),
        ),
        entityType: List<ValuesModel>.from(
          (json['rmo_appeal_reasons'][3]['values'] as List<dynamic>)
              .map<ValuesModel>(
            (x) => ValuesModel.fromJson(x as Map<String, dynamic>),
          ),
        ),
      );

  @override
  String toString() =>
      'StaticModel(status: $status, entityType: $entityType, isThereAnyFaultOfSociety: $isThereAnyFaultOfSociety)';
}
