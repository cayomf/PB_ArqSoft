// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) => AdminModel(
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
      cep: json['cep'],
      complemento: json['complemento'],
      adminId: json['adminId'] as String,
    );

Map<String, dynamic> _$AdminModelToJson(AdminModel instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'email': instance.email,
      'telefone': instance.telefone,
      'cep': instance.cep,
      'complemento': instance.complemento,
      'adminId': instance.adminId,
    };
