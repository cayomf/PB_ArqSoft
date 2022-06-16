import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

class Enterprise extends User {
  final String cnpj;

  const Enterprise({nome, email, telefone, cep, complemento, required this.cnpj})
      : super(nome: nome, email: email, telefone: telefone, complemento: complemento, cep: cep);
}
