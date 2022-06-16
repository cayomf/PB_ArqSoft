import 'package:ventura_hr/area-logada/external/models/candidacy/candidacy.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class CandidacyRepository {
  Future<Result<void>> create({required CandidacyModel candidacy});
  Future<Result<void>> edit({required CandidacyModel candidacy});
  Future<Result<void>> delete({required String id});
  Future<Result<CandidacyModel>> getById({required String id});
  Future<Result<List<CandidacyModel>>> getAll();
}
