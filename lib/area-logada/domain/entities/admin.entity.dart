import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

class Admin extends User {
  final String adminId;

  const Admin({nome, email, telefone, cep, complemento, required this.adminId})
      : super(nome: nome, email: email, telefone: telefone, cep: cep, complemento: complemento);
}
