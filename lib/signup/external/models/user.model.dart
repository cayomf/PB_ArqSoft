import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;
  final String nome;
  final String email;
  final String telefone;
  final String endereco;
  final bool? status;
  final int accountType;

  const UserModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.status,
    required this.accountType,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
