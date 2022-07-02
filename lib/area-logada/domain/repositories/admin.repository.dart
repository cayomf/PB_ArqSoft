import 'package:ventura_hr/area-logada/external/models/admin/admin.model.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class AdminRepository {
  Future<Result<void>> create({required AdminModel admin});
  Future<Result<AdminModel>> getById({required String id});
  Future<Result<List<AdminModel>>> getAll();
}
