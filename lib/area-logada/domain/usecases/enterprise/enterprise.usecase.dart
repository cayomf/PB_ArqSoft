import 'package:ventura_hr/area-logada/domain/entities/enterprise.entity.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';

abstract class EnterpriseUsecase {
  Future<Result<void>> create({required Enterprise enterprise});
  Future<Result<void>> edit({required Enterprise enterprise});
  Future<Result<void>> delete({required String id});
  Future<Result<Enterprise>> getById({required String id});
  Future<Result<List<Enterprise>>> getAll();
}
