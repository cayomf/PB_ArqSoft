import 'package:equatable/equatable.dart';
import 'criterion.entity.dart';

class Vacancy extends Equatable {
  final String empresaId;
  final DateTime dataCriacao;
  final String cargo;
  final String complemento;
  final String cep;
  final String status;
  final List<Criterion> criterios;

  const Vacancy({
    required this.empresaId,
    required this.dataCriacao,
    required this.cargo,
    required this.complemento,
    required this.cep,
    required this.status,
    required this.criterios,
  });

  @override
  List<Object?> get props => [
        empresaId,
        dataCriacao,
        cargo,
        complemento,
        cep,
        status,
        criterios,
      ];
}
