import 'package:equatable/equatable.dart';

class Criterion extends Equatable {
  final int id;
  final String descricao;
  final int peso;

  const Criterion({
    required this.id,
    required this.descricao,
    required this.peso,
  });

  @override
  List<Object?> get props => [
        descricao,
        peso,
      ];
}
