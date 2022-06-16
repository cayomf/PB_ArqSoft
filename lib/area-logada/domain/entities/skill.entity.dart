import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final String criterioId;
  final int level;

  const Skill({
    required this.criterioId,
    required this.level,
  });

  @override
  List<Object?> get props => [
        criterioId,
        level,
      ];
}
