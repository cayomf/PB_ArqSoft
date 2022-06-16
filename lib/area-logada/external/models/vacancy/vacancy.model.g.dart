// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vacancy.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VacancyModel _$VacancyModelFromJson(Map<String, dynamic> json) => VacancyModel(
      empresaId: json['empresaId'] as String,
      dataCriacao: DateTime.parse(json['dataCriacao'] as String),
      cargo: json['cargo'] as String,
      complemento: json['complemento'] as String,
      cep: json['cep'] as String,
      status: json['status'] as String,
      criterios: (json['criterios'] as List<dynamic>)
          .map((e) => CriterionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VacancyModelToJson(VacancyModel instance) =>
    <String, dynamic>{
      'empresaId': instance.empresaId,
      'dataCriacao': instance.dataCriacao.toIso8601String(),
      'cargo': instance.cargo,
      'complemento': instance.complemento,
      'cep': instance.cep,
      'status': instance.status,
      'criterios': instance.criterios,
    };
