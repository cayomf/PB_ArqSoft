import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/login-firebase/domain/errors/errors.dart';
import 'package:ventura_hr/login-firebase/domain/repositories/login_repository.dart';

part 'logout.g.dart';

abstract class Logout {
  Future<Either<Failure, Unit>> call();
}

@Injectable(singleton: false)
class LogoutImpl implements Logout {
  final LoginRepository repository;

  LogoutImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await repository.logout();
  }
}
