import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  final String nome;
  final String email;
  final String telefone;
  final String cep;
  final String complemento;

  const UserModel({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.cep,
    required this.complemento,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
