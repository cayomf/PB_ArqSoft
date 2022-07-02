import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

abstract class UserUsecase {
  Future<Result<void>> create({required var user});
  Future<Result<dynamic>> findByEmail({required String email});
  Future<Result<void>> getAll();
}
