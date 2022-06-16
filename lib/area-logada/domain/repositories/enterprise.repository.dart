import 'package:ventura_hr/area-logada/external/models/enterprise/enterprise.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class EnterpriseRepository {
  Future<Result<void>> create({required EnterpriseModel enterprise});
  Future<Result<void>> edit({required EnterpriseModel enterprise});
  Future<Result<void>> delete({required String id});
  Future<Result<EnterpriseModel>> getById({required String id});
  Future<Result<List<EnterpriseModel>>> getAll();
}
