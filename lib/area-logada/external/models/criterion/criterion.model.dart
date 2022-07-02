import 'package:json_annotation/json_annotation.dart';

part 'criterion.model.g.dart';

@JsonSerializable()
class CriterionModel {
  final int id;
  final String descricao;
  final int peso;

  const CriterionModel({
    required this.id,
    required this.descricao,
    required this.peso,
  });

  factory CriterionModel.fromJson(Map<String, dynamic> json) => _$CriterionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CriterionModelToJson(this);
}
