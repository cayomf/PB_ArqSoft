import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

class Candidate extends User {
  final String cpf;

  const Candidate({nome, email, telefone, endereco, status, accountType, id, required this.cpf})
      : super(
          nome: nome,
          email: email,
          telefone: telefone,
          endereco: endereco,
          status: status,
          id: id,
          accountType: accountType,
        );
}
