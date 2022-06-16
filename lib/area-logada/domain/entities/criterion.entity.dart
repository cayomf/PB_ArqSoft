import 'package:equatable/equatable.dart';

class Criterion extends Equatable {
  final String vagaId;
  final String descricao;
  final int relevancia;
  final int peso;

  const Criterion({
    required this.vagaId,
    required this.descricao,
    required this.relevancia,
    required this.peso,
  });

  @override
  List<Object?> get props => [
        descricao,
        relevancia,
        peso,
      ];
}
