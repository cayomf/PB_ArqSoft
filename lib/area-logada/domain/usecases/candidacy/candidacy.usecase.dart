import 'package:ventura_hr/area-logada/domain/entities/candidacy.entity.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class CandidacyUsecase {
  Future<Result<void>> create({required Candidacy candidacy});
  Future<Result<void>> edit({required Candidacy candidacy});
  Future<Result<void>> delete({required String id});
  Future<Result<Candidacy>> getById({required String id});
  Future<Result<List<Candidacy>>> getAll();
}
