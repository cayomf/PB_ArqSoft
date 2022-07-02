import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/signup/external/models/user.model.dart';

abstract class UserRepository {
  Future<Result<void>> create({required var user});
  Future<Result<dynamic>> findByEmail({required String email});
  Future<Result<List<UserModel>>> getAll();
}
