import 'package:ventura_hr/area-logada/domain/entities/admin.entity.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class AdminUsecase {
  Future<Result<void>> create({required Admin admin});
  Future<Result<void>> edit({required Admin admin});
  Future<Result<void>> delete({required String id});
  Future<Result<Admin>> getById({required String id});
  Future<Result<List<Admin>>> getAll();
}
