import 'package:ventura_hr/area-logada/external/models/vacancy/vacancy.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class VacancyRepository {
  Future<Result<void>> create({required VacancyModel vacancy});
  Future<Result<void>> edit({required VacancyModel vacancy});
  Future<Result<void>> delete({required String id});
  Future<Result<VacancyModel>> getById({required String id});
  Future<Result<List<VacancyModel>>> getAll();
}
