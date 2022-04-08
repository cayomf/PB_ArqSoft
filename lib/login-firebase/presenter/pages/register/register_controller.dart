import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:ventura_hr/login-firebase/domain/entities/login_credential.dart';
import 'package:ventura_hr/login-firebase/domain/usecases/register_user.dart';
import 'package:ventura_hr/login-firebase/presenter/utils/loading_dialog.dart';
import 'package:ventura_hr/shared/stores/auth_store.dart';

part 'register_controller.g.dart';

@Injectable()
class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final RegisterUser registerUser;
  final LoadingDialog loading;
  final AuthStore authStore;

  _RegisterControllerBase(this.registerUser, this.loading, this.authStore);

  @observable
  String email = "";

  @action
  setEmail(String value) => this.email = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => this.password = value;

  @computed
  LoginCredential get credential => LoginCredential.withEmailAndPassword(email: email, password: password);

  @computed
  bool get isValid => credential.isValidEmail && credential.isValidPassword;

  enterEmail() async {
    loading.show();
    await Future.delayed(Duration(seconds: 1));
    var result = await registerUser(email: credential.email!, password: credential.password!);
    await loading.hide();
    result.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
    }, (_) {
      //authStore.setUser(user);
      //Modular.to.popUntil(ModalRoute.withName(Modular.to.modulePath));
      Modular.to.pop();
    });
  }
}
