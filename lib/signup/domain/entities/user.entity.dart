import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String nome;
  final String email;
  final String telefone;
  final String endereco;
  final bool? status;
  final int accountType;

  const User({
    required this.id,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.endereco,
    required this.status,
    required this.accountType,
  });

  @override
  List<Object?> get props => [nome, email, telefone, endereco, status];
}
