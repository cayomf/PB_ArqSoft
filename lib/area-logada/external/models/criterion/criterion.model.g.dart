// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'criterion.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CriterionModel _$CriterionModelFromJson(Map<String, dynamic> json) =>
    CriterionModel(
      id: json['id'] as int,
      descricao: json['descricao'] as String,
      peso: json['peso'] as int,
    );

Map<String, dynamic> _$CriterionModelToJson(CriterionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
      'peso': instance.peso,
    };
