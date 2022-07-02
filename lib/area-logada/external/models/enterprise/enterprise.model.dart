import 'package:json_annotation/json_annotation.dart';
import 'package:ventura_hr/signup/external/models/user.model.dart';

part 'enterprise.model.g.dart';

@JsonSerializable()
class EnterpriseModel extends UserModel {
  final String cnpj;

  const EnterpriseModel({nome, email, telefone, status, endereco, id, accountType, required this.cnpj})
      : super(
            nome: nome,
            email: email,
            telefone: telefone,
            endereco: endereco,
            status: status,
            id: id,
            accountType: accountType);

  factory EnterpriseModel.fromJson(Map<String, dynamic> json) => _$EnterpriseModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EnterpriseModelToJson(this);
}
