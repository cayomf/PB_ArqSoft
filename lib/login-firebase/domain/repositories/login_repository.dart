import 'package:dartz/dartz.dart';
import 'package:ventura_hr/login-firebase/domain/entities/logged_user_info.dart';
import 'package:ventura_hr/login-firebase/domain/errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginEmail({String email, String password});
  Future<Either<Failure, LoggedUserInfo>> loginPhone({String phone});
  Future<Either<Failure, LoggedUserInfo>> verifyPhoneCode({String verificationId, String code});

  Future<Either<Failure, LoggedUserInfo>> loggedUser();

  register({String email, String password});

  Future<Either<Failure, Unit>> logout();
}
