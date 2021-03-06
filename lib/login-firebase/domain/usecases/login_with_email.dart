import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/login-firebase/domain/entities/logged_user_info.dart';
import 'package:ventura_hr/login-firebase/domain/entities/login_credential.dart';
import 'package:ventura_hr/login-firebase/domain/errors/errors.dart';
import 'package:ventura_hr/login-firebase/domain/repositories/login_repository.dart';
import 'package:ventura_hr/login-firebase/domain/services/connectivity_service.dart';

part 'login_with_email.g.dart';

abstract class LoginWithEmail {
  Future<Either<Failure, LoggedUserInfo?>> call(LoginCredential credential);
}

@Injectable(singleton: false)
class LoginWithEmailImpl implements LoginWithEmail {
  final LoginRepository repository;
  final ConnectivityService service;

  LoginWithEmailImpl(this.repository, this.service);

  @override
  Future<Either<Failure, LoggedUserInfo?>> call(LoginCredential credential) async {
    var result = await service.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    if (!credential.isValidEmail) {
      return Left(ErrorLoginEmail(message: "Invalid Email"));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginEmail(message: "Invalid Password"));
    }

    return await repository.loginEmail(
      email: credential.email!,
      password: credential.password!,
    );
  }
}
