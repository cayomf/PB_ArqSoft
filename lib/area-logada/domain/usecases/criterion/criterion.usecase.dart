import 'package:ventura_hr/area-logada/domain/entities/criterion.entity.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class CriterionUsecase {
  Future<Result<void>> create({required Criterion criterion});
  Future<Result<void>> edit({required Criterion criterion});
  Future<Result<void>> delete({required String id});
  Future<Result<Criterion>> getById({required String id});
  Future<Result<List<Criterion>>> getAll();
}
