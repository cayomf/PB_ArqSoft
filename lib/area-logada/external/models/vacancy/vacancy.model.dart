import 'package:json_annotation/json_annotation.dart';
import 'package:ventura_hr/area-logada/external/models/criterion/criterion.model.dart';

part 'vacancy.model.g.dart';

@JsonSerializable()
class VacancyModel {
  final String empresaId;
  final DateTime dataCriacao;
  final String cargo;
  final String complemento;
  final String cep;
  final String status;
  final List<CriterionModel> criterios;

  const VacancyModel({
    required this.empresaId,
    required this.dataCriacao,
    required this.cargo,
    required this.complemento,
    required this.cep,
    required this.status,
    required this.criterios,
  });

  factory VacancyModel.fromJson(Map<String, dynamic> json) => _$VacancyModelFromJson(json);
  Map<String, dynamic> toJson() => _$VacancyModelToJson(this);
}
