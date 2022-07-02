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
      status: json['status'],
      endereco: json['endereco'],
      id: json['id'],
      accountType: json['accountType'],
      cpf: json['cpf'] as String,
    );

Map<String, dynamic> _$CandidateModelToJson(CandidateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      'telefone': instance.telefone,
      'endereco': instance.endereco,
      'status': instance.status,
      'accountType': instance.accountType,
      'cpf': instance.cpf,
    };
