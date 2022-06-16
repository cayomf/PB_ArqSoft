import 'package:json_annotation/json_annotation.dart';
import 'package:ventura_hr/signup/external/models/user.model.dart';

part 'enterprise.model.g.dart';

@JsonSerializable()
class EnterpriseModel extends UserModel {
  final String cnpj;

  const EnterpriseModel({nome, email, telefone, cep, complemento, required this.cnpj})
      : super(nome: nome, email: email, telefone: telefone, complemento: complemento, cep: cep);

  factory EnterpriseModel.fromJson(Map<String, dynamic> json) => _$EnterpriseModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EnterpriseModelToJson(this);
}
