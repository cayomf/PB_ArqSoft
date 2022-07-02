import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

class Admin extends User {
  final String adminId;

  const Admin({nome, email, telefone, endereco, status, accountType, id, required this.adminId})
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
