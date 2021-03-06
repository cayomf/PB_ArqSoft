import 'package:dartz/dartz.dart';
import 'package:ventura_hr/login-firebase/domain/errors/errors.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
