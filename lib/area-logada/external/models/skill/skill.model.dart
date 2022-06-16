import 'package:json_annotation/json_annotation.dart';

part 'skill.model.g.dart';

@JsonSerializable()
class SkillModel {
  final String criterioId;
  final int level;

  const SkillModel({
    required this.criterioId,
    required this.level,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) => _$SkillModelFromJson(json);
  Map<String, dynamic> toJson() => _$SkillModelToJson(this);
}
