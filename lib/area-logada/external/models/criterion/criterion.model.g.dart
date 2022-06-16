// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criterion.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CriterionModel _$CriterionModelFromJson(Map<String, dynamic> json) =>
    CriterionModel(
      vagaId: json['vagaId'] as String,
      descricao: json['descricao'] as String,
      relevancia: json['relevancia'] as int,
      peso: json['peso'] as int,
    );

Map<String, dynamic> _$CriterionModelToJson(CriterionModel instance) =>
    <String, dynamic>{
      'vagaId': instance.vagaId,
      'descricao': instance.descricao,
      'relevancia': instance.relevancia,
      'peso': instance.peso,
    };
