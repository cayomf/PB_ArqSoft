import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/login-firebase/domain/repositories/login_repository.dart';

part 'register_user.g.dart';

abstract class RegisterUser {
  call({String email, String password});
}

@Injectable(singleton: false)
class RegisterUserImpl implements RegisterUser {
  final LoginRepository repository;

  RegisterUserImpl(this.repository);

  @override
  call({String email = '', String password = ''}) async {
    await repository.register(email: email, password: password);
  }
}
