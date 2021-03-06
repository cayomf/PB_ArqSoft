import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:ventura_hr/area-logada/domain/entities/admin.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/candidate.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/enterprise.entity.dart';
import 'package:ventura_hr/login-firebase/domain/entities/login_credential.dart';
import 'package:ventura_hr/login-firebase/domain/usecases/login_with_email.dart';
import 'package:ventura_hr/login-firebase/presenter/utils/loading_dialog.dart';
import 'package:ventura_hr/shared/enums/result-type.enum.dart';
import 'package:ventura_hr/shared/helper/error-result.helper.dart';
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/helper/success-result.helper.dart';
import 'package:ventura_hr/shared/stores/auth_store.dart';
import 'package:ventura_hr/signup/domain/usecases/user.usecase.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithEmail loginWithEmailUsecase;
  final UserUsecase userUsecase;
  final LoadingDialog loading;
  final AuthStore authStore;

  _LoginControllerBase(
    this.loginWithEmailUsecase,
    this.loading,
    this.authStore,
    this.userUsecase,
  );

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
    var result = await loginWithEmailUsecase(credential);
    await loading.hide();
    result.fold((failure) {
      asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
    }, (user) async {
      Result<dynamic> resultGetUser = await userUsecase.findByEmail(email: credential.email!);
      authStore.setUser(user);

      if (resultGetUser.isSuccess()) {
        authStore.userData = resultGetUser.getSuccessData();

        if (resultGetUser.getSuccessData() is Candidate) {
          Modular.to.pushNamed('home-candidato');
        } else if (resultGetUser.getSuccessData() is Enterprise) {
          Modular.to.navigate('home-empresa');
        } else if (resultGetUser.getSuccessData() is Admin) {
          Modular.to.navigate('home-empresa');
        }
      }
    });
  }
}
