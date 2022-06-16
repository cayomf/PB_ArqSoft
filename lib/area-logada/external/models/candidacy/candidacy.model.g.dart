// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidacy.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidacyModel _$CandidacyModelFromJson(Map<String, dynamic> json) =>
    CandidacyModel(
      vagaId: json['vagaId'] as String,
      candidatoId: json['candidatoId'] as String,
      skills: (json['skills'] as List<dynamic>)
          .map((e) => SkillModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CandidacyModelToJson(CandidacyModel instance) =>
    <String, dynamic>{
      'vagaId': instance.vagaId,
      'candidatoId': instance.candidatoId,
      'skills': instance.skills,
    };
