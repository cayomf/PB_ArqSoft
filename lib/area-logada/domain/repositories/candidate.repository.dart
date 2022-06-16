import 'package:ventura_hr/area-logada/external/models/candidate/candidate.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class CandidateRepository {
  Future<Result<void>> create({required CandidateModel candidate});
  Future<Result<void>> edit({required CandidateModel candidate});
  Future<Result<void>> delete({required String id});
  Future<Result<CandidateModel>> getById({required String id});
  Future<Result<List<CandidateModel>>> getAll();
}
