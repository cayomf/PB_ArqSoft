import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

class Enterprise extends User {
  final String cnpj;

  const Enterprise({nome, email, telefone, endereco, status, accountType, id, required this.cnpj})
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
