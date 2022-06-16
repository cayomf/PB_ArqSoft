import 'package:ventura_hr/area-logada/domain/entities/candidacy.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/skill.entity.dart';
import 'package:ventura_hr/area-logada/domain/repositories/candidacy.repository.dart';
import 'package:ventura_hr/area-logada/domain/usecases/candidacy/candidacy.usecase.dart';
import 'package:ventura_hr/area-logada/external/models/candidacy/candidacy.model.dart';
import 'package:ventura_hr/area-logada/external/models/skill/skill.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';

class CandidacyUsecaseImpl implements CandidacyUsecase {
  final CandidacyRepository repository;

  CandidacyUsecaseImpl(this.repository);

  @override
  Future<Result<void>> create({required Candidacy candidacy}) async {
    List<SkillModel> skills = [];

    candidacy.skills.map((skill) => skills.add(SkillModel(criterioId: skill.criterioId, level: skill.level)));
    CandidacyModel candidacyModelObj = CandidacyModel(
      candidatoId: candidacy.candidatoId,
      skills: skills,
      vagaId: candidacy.vagaId,
    );

    return await repository.create(candidacy: candidacyModelObj);
  }

  @override
  Future<Result<void>> edit({required Candidacy candidacy}) async {
    List<SkillModel> skills = [];

    candidacy.skills.map((skill) => skills.add(SkillModel(criterioId: skill.criterioId, level: skill.level)));
    CandidacyModel candidacyModelObj = CandidacyModel(
      candidatoId: candidacy.candidatoId,
      skills: skills,
      vagaId: candidacy.vagaId,
    );

    return await repository.edit(candidacy: candidacyModelObj);
  }

  @override
  Future<Result<void>> delete({required String id}) async {
    return await repository.delete(id: id);
  }

  @override
  Future<Result<Candidacy>> getById({required String id}) async {
    var result = await repository.getById(id: id);
    List<Skill> skills = [];

    if (result.isSuccess()) {
      skills.map((skill) => skills.add(Skill(criterioId: skill.criterioId, level: skill.level)));
      Candidacy candidacy = Candidacy(
        candidatoId: result.getSuccessData().candidatoId,
        skills: skills,
        vagaId: result.getSuccessData().vagaId,
      );

      return SuccessResult(candidacy);
    } else {
      return result.convertErrorResult();
    }
  }

  @override
  Future<Result<List<Candidacy>>> getAll() async {
    var result = await repository.getAll();
    List<Candidacy> candidacies = [];

    if (result.isSuccess()) {
      result.getSuccessData().map((candidacy) {
        List<Skill> skills = [];

        candidacy.skills.map((skill) => skills.add(Skill(criterioId: skill.criterioId, level: skill.level)));
        candidacies.add(
          Candidacy(
            candidatoId: candidacy.candidatoId,
            skills: skills,
            vagaId: candidacy.vagaId,
          ),
        );
      });

      return SuccessResult(candidacies);
    } else {
      return result.convertErrorResult();
    }
  }
}
