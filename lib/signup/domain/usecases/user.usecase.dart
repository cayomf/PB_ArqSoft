import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

abstract class UserUsecase {
  Future<Result<void>> create({required User user});
  Future<Result<void>> edit({required User user});
  Future<Result<void>> delete({required String id});
  Future<Result<void>> getById({required String id});
  Future<Result<void>> getAll();
}
