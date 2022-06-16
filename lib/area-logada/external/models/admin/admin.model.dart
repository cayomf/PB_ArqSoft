import 'package:ventura_hr/signup/external/models/user.model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin.model.g.dart';

@JsonSerializable()
class AdminModel extends UserModel {
  final String adminId;

  const AdminModel({nome, email, telefone, cep, complemento, required this.adminId})
      : super(nome: nome, email: email, telefone: telefone, cep: cep, complemento: complemento);

  factory AdminModel.fromJson(Map<String, dynamic> json) => _$AdminModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AdminModelToJson(this);
}
