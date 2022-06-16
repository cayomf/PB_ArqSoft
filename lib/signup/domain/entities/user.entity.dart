import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String nome;
  final String email;
  final String telefone;
  final String cep;
  final String complemento;

  const User({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.cep,
    required this.complemento,
  });

  @override
  List<Object?> get props => [
        nome,
        email,
        telefone,
        cep,
      ];
}
