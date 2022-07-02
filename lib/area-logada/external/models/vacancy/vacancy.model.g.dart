// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VacancyModel _$VacancyModelFromJson(Map<String, dynamic> json) => VacancyModel(
      id: json['id'] as int?,
      empresaId: json['empresaId'] as String,
      dataCriacao: DateTime.parse(json['dataCriacao'] as String),
      cargo: json['cargo'] as String,
      endereco: json['endereco'] as String,
      salario: (json['salario'] as num).toDouble(),
      status: json['status'] as String,
      criterios: (json['criterios'] as List<dynamic>)
          .map((e) => CriterionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VacancyModelToJson(VacancyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'empresaId': instance.empresaId,
      'dataCriacao': instance.dataCriacao.toIso8601String(),
      'cargo': instance.cargo,
      'endereco': instance.endereco,
      'status': instance.status,
      'salario': instance.salario,
      'criterios': instance.criterios,
    };
