import 'package:ventura_hr/area-logada/external/models/criterion/criterion.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class CriterionRepository {
  Future<Result<void>> create({required CriterionModel criterion});
  Future<Result<void>> edit({required CriterionModel criterion});
  Future<Result<void>> delete({required String id});
  Future<Result<CriterionModel>> getById({required String id});
  Future<Result<List<CriterionModel>>> getAll();
}
