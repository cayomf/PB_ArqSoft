// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnterpriseModel _$EnterpriseModelFromJson(Map<String, dynamic> json) =>
    EnterpriseModel(
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
      cep: json['cep'],
      complemento: json['complemento'],
      cnpj: json['cnpj'] as String,
    );

Map<String, dynamic> _$EnterpriseModelToJson(EnterpriseModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'email': instance.email,
      'telefone': instance.telefone,
      'cep': instance.cep,
      'complemento': instance.complemento,
      'cnpj': instance.cnpj,
    };
