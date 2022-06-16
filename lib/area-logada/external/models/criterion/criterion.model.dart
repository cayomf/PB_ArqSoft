import 'package:json_annotation/json_annotation.dart';

part 'criterion.model.g.dart';

@JsonSerializable()
class CriterionModel {
  final String vagaId;
  final String descricao;
  final int relevancia;
  final int peso;

  const CriterionModel({
    required this.vagaId,
    required this.descricao,
    required this.relevancia,
    required this.peso,
  });

  factory CriterionModel.fromJson(Map<String, dynamic> json) => _$CriterionModelFromJson(json);
  Map<String, dynamic> toJson() => _$CriterionModelToJson(this);
}
