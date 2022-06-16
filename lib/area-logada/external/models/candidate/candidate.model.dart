import 'package:json_annotation/json_annotation.dart';
import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

part 'candidate.model.g.dart';

@JsonSerializable()
class CandidateModel extends User {
  final String cpf;

  const CandidateModel({nome, email, telefone, cep, complemento, required this.cpf})
      : super(nome: nome, email: email, telefone: telefone, cep: cep, complemento: complemento);

  factory CandidateModel.fromJson(Map<String, dynamic> json) => _$CandidateModelFromJson(json);
  Map<String, dynamic> toJson() => _$CandidateModelToJson(this);
}
