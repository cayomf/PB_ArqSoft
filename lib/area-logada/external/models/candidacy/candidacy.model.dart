import 'package:json_annotation/json_annotation.dart';
import 'package:ventura_hr/area-logada/external/models/skill/skill.model.dart';

part 'candidacy.model.g.dart';

@JsonSerializable()
class CandidacyModel {
  final String vagaId;
  final String candidatoId;
  final List<SkillModel> skills;

  const CandidacyModel({
    required this.vagaId,
    required this.candidatoId,
    required this.skills,
  });

  factory CandidacyModel.fromJson(Map<String, dynamic> json) => _$CandidacyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CandidacyModelToJson(this);
}
