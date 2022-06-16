import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

class Candidate extends User {
  final String cpf;

  const Candidate({nome, email, telefone, cep, complemento, required this.cpf})
      : super(nome: nome, email: email, telefone: telefone, cep: cep, complemento: complemento);
}
