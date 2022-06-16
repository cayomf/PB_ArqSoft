import 'package:ventura_hr/area-logada/domain/entities/vacancy.entity.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class VacancyUsecase {
  Future<Result<void>> create({required Vacancy vacancy});
  Future<Result<void>> edit({required Vacancy vacancy});
  Future<Result<void>> delete({required String id});
  Future<Result<Vacancy>> getById({required String id});
  Future<Result<List<Vacancy>>> getAll();
}
