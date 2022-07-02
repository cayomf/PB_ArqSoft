import 'package:json_annotation/json_annotation.dart';
import 'package:ventura_hr/signup/external/models/user.model.dart';

part 'candidate.model.g.dart';

@JsonSerializable()
class CandidateModel extends UserModel {
  final String cpf;

  const CandidateModel({nome, email, telefone, status, endereco, id, accountType, required this.cpf})
      : super(
            nome: nome,
            email: email,
            telefone: telefone,
            status: status,
            endereco: endereco,
            id: id,
            accountType: accountType);

  factory CandidateModel.fromJson(Map<String, dynamic> json) => _$CandidateModelFromJson(json);
  Map<String, dynamic> toJson() => _$CandidateModelToJson(this);
}
