import 'package:ventura_hr/area-logada/domain/entities/candidate.entity.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class CandidateUsecase {
  Future<Result<void>> create({required Candidate candidate});
  Future<Result<void>> edit({required Candidate candidate});
  Future<Result<void>> delete({required String id});
  Future<Result<Candidate>> getById({required String id});
  Future<Result<List<Candidate>>> getAll();
}
