import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/login-firebase/domain/entities/logged_user_info.dart';
import 'package:ventura_hr/login-firebase/domain/entities/login_credential.dart';
import 'package:ventura_hr/login-firebase/domain/errors/errors.dart';
import 'package:ventura_hr/login-firebase/domain/repositories/login_repository.dart';
import 'package:ventura_hr/login-firebase/domain/services/connectivity_service.dart';
part 'verify_phone_code.g.dart';

abstract class VerifyPhoneCode {
  Future<Either<Failure, LoggedUserInfo?>> call(LoginCredential c);
}

@Injectable(singleton: false)
class VerifyPhoneCodeImpl implements VerifyPhoneCode {
  final LoginRepository repository;
  final ConnectivityService service;

  VerifyPhoneCodeImpl(this.repository, this.service);

  @override
  Future<Either<Failure, LoggedUserInfo?>> call(LoginCredential c) async {
    if (!c.isValidCode) {
      return Left(ErrorLoginPhone(message: "Invalid Code"));
    } else if (!c.isValidVerificationId) {
      return Left(InternalError(message: "Internal Error: VERIFICATION_ID"));
    }

    var result = await service.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await repository.verifyPhoneCode(
      verificationId: c.verificationId!,
      code: c.code!,
    );
  }
}
