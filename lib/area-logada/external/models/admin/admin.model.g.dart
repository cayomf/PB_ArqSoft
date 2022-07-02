// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) => AdminModel(
      nome: json['nome'],
      email: json['email'],
      telefone: json['telefone'],
      status: json['status'],
      endereco: json['endereco'],
      id: json['id'],
      accountType: json['accountType'],
      adminId: json['adminId'] as String,
    );

Map<String, dynamic> _$AdminModelToJson(AdminModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      'telefone': instance.telefone,
      'endereco': instance.endereco,
      'status': instance.status,
      'accountType': instance.accountType,
      'adminId': instance.adminId,
    };
