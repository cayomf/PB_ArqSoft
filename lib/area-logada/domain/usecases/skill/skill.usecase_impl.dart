import 'package:ventura_hr/area-logada/domain/entities/skill.entity.dart';
import 'package:ventura_hr/area-logada/domain/repositories/skill.repository.dart';
import 'package:ventura_hr/area-logada/domain/usecases/skill/skill.usecase.dart';
import 'package:ventura_hr/area-logada/external/models/skill/skill.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';

class SkillUsecaseImpl implements SkillUsecase {
  final SkillRepository repository;

  SkillUsecaseImpl(this.repository);

  @override
  Future<Result<void>> create({required Skill skill}) async {
    SkillModel skillModelObj = SkillModel(
      criterioId: skill.criterioId,
      level: skill.level,
    );

    return await repository.create(skill: skillModelObj);
  }

  @override
  Future<Result<void>> edit({required Skill skill}) async {
    SkillModel skillModelObj = SkillModel(
      criterioId: skill.criterioId,
      level: skill.level,
    );

    return await repository.edit(skill: skillModelObj);
  }

  @override
  Future<Result<void>> delete({required String id}) async {
    return await repository.delete(id: id);
  }

  @override
  Future<Result<Skill>> getById({required String id}) async {
    var result = await repository.getById(id: id);

    if (result.isSuccess()) {
      Skill skill = Skill(
        criterioId: result.getSuccessData().criterioId,
        level: result.getSuccessData().level,
      );

      return SuccessResult(skill);
    } else {
      return result.convertErrorResult();
    }
  }

  @override
  Future<Result<List<Skill>>> getAll() async {
    var result = await repository.getAll();
    List<Skill> skills = [];

    if (result.isSuccess()) {
      result.getSuccessData().map((skill) {
        skills.add(
          Skill(
            criterioId: skill.criterioId,
            level: skill.level,
          ),
        );
      });

      return SuccessResult(skills);
    } else {
      return result.convertErrorResult();
    }
  }
}
