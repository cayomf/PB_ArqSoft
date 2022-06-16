import 'package:ventura_hr/area-logada/domain/entities/skill.entity.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class SkillUsecase {
  Future<Result<void>> create({required Skill skill});
  Future<Result<void>> edit({required Skill skill});
  Future<Result<void>> delete({required String id});
  Future<Result<Skill>> getById({required String id});
  Future<Result<List<Skill>>> getAll();
}
