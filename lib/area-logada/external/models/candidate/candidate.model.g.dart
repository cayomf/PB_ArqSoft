// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CandidateModel _$CandidateModelFromJson(Map<String, dynamic> json) =>
    CandidateModel(
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
      cep: json['cep'],
      complemento: json['complemento'],
      cpf: json['cpf'] as String,
    );

Map<String, dynamic> _$CandidateModelToJson(CandidateModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'email': instance.email,
      'telefone': instance.telefone,
      'cep': instance.cep,
      'complemento': instance.complemento,
      'cpf': instance.cpf,
    };
