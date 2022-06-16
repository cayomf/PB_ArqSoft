import 'package:ventura_hr/area-logada/external/models/skill/skill.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class SkillRepository {
  Future<Result<void>> create({required SkillModel skill});
  Future<Result<void>> edit({required SkillModel skill});
  Future<Result<void>> delete({required String id});
  Future<Result<SkillModel>> getById({required String id});
  Future<Result<List<SkillModel>>> getAll();
}
