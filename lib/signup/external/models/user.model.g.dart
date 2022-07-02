// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      nome: json['nome'] as String,
      email: json['email'] as String,
      telefone: json['telefone'] as String,
      endereco: json['endereco'] as String,
      status: json['status'] as bool?,
      accountType: json['accountType'] as int,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'email': instance.email,
      'telefone': instance.telefone,
      'endereco': instance.endereco,
      'status': instance.status,
      'accountType': instance.accountType,
    };
