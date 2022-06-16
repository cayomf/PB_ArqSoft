import 'package:equatable/equatable.dart';
import 'skill.entity.dart';

class Candidacy extends Equatable {
  final String vagaId;
  final String candidatoId;
  final List<Skill> skills;

  const Candidacy({
    required this.vagaId,
    required this.candidatoId,
    required this.skills,
  });

  @override
  List<Object?> get props => [
        vagaId,
        candidatoId,
        skills,
      ];
}
