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
      status: json['status'],
      endereco: json['endereco'],
      id: json['id'],
      accountType: json['accountType'],
      cnpj: json['cnpj'] as String,
    );

Map<String, dynamic> _$EnterpriseModelToJson(EnterpriseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      'telefone': instance.telefone,
      'endereco': instance.endereco,
      'status': instance.status,
      'accountType': instance.accountType,
      'cnpj': instance.cnpj,
    };
