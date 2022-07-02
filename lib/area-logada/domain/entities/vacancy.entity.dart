import 'package:equatable/equatable.dart';
import 'criterion.entity.dart';

class Vacancy extends Equatable {
  final int? id;
  final String empresaId;
  final DateTime dataCriacao;
  final String cargo;
  final String endereco;
  final String status;
  final double salario;
  final List<Criterion> criterios;

  const Vacancy({
    required this.id,
    required this.empresaId,
    required this.dataCriacao,
    required this.cargo,
    required this.endereco,
    required this.status,
    required this.salario,
    required this.criterios,
  });

  @override
  List<Object?> get props => [
        id,
        empresaId,
        dataCriacao,
        cargo,
        endereco,
        salario,
        status,
        criterios,
      ];
}
