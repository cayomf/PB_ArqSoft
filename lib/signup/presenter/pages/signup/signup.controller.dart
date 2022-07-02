import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ventura_hr/area-logada/domain/entities/admin.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/candidate.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/enterprise.entity.dart';
import 'package:ventura_hr/login-firebase/domain/entities/login_credential.dart';
import 'package:ventura_hr/login-firebase/domain/usecases/login_with_email.dart';
import 'package:ventura_hr/login-firebase/domain/usecases/register_user.dart';
import 'package:ventura_hr/login-firebase/presenter/utils/loading_dialog.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:ventura_hr/shared/helper/result.helper.dart';
import 'package:ventura_hr/shared/stores/auth_store.dart';
import 'package:ventura_hr/signup/domain/usecases/user.usecase.dart';

part 'signup.controller.g.dart';

@Injectable()
class SignupController = _SignupControllerBase with _$SignupController;

enum TipoConta { candidato, empresa }

abstract class _SignupControllerBase with Store {
  final LoginWithEmail loginWithEmailUsecase;
  final RegisterUser registerUser;
  final LoadingDialog loading;
  final AuthStore authStore;
  final UserUsecase userUsecase;

  _SignupControllerBase(
    this.loginWithEmailUsecase,
    this.authStore,
    this.registerUser,
    this.loading,
    this.userUsecase,
  );

  @observable
  TipoConta? tipoConta;

  @observable
  Admin admin = Admin(
    adminId: "",
    nome: "",
    email: "",
    telefone: "",
    endereco: "",
    status: true,
    accountType: 3,
  );

  @observable
  Candidate candidate = Candidate(
    cpf: '',
    nome: "",
    email: "",
    telefone: "",
    endereco: "",
    status: true,
    accountType: 1,
  );

  @observable
  Enterprise enterprise = Enterprise(
    cnpj: '',
    nome: "",
    email: "",
    telefone: "",
    endereco: "",
    status: true,
    accountType: 2,
  );

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  updateAdmin({
    String? endereco,
    String? email,
    String? telefone,
    String? adminId,
    String? nome,
  }) {
    admin = Admin(
      status: admin.status,
      email: email ?? admin.email,
      endereco: endereco ?? admin.endereco,
      telefone: telefone ?? admin.telefone,
      adminId: adminId ?? admin.adminId,
      nome: nome ?? admin.nome,
      accountType: admin.accountType,
    );
  }

  @action
  updateEnterprise({
    String? endereco,
    String? email,
    String? telefone,
    String? cnpj,
    String? nome,
  }) {
    enterprise = Enterprise(
      status: enterprise.status,
      email: email ?? enterprise.email,
      endereco: endereco ?? enterprise.endereco,
      telefone: telefone ?? enterprise.telefone,
      cnpj: cnpj ?? enterprise.cnpj,
      nome: nome ?? enterprise.nome,
      accountType: enterprise.accountType,
    );
  }

  @action
  updateCandidate({
    String? endereco,
    String? email,
    String? telefone,
    String? cpf,
    String? nome,
  }) {
    candidate = Candidate(
      status: candidate.status,
      email: email ?? candidate.email,
      endereco: endereco ?? candidate.endereco,
      telefone: telefone ?? candidate.telefone,
      cpf: cpf ?? candidate.cpf,
      nome: nome ?? candidate.nome,
      accountType: candidate.accountType,
    );
  }

  @computed
  LoginCredential get credential => LoginCredential.withEmailAndPassword(email: email, password: password);

  @computed
  bool get isCredentialsValid => credential.isValidEmail && credential.isValidPassword;

  signup() async {
    var userCreated;
    Result<void>? resultCreateUser;

    loading.show();
    await Future.delayed(Duration(seconds: 1));

    try {
      await registerUser(email: email, password: password);
    } catch (e) {
      asuka.showSnackBar(SnackBar(content: Text("Erro inesperado. Tente novamente mais tarde.")));
    }

    if (tipoConta == TipoConta.candidato) {
      userCreated = candidate;
    } else if (tipoConta == TipoConta.empresa) {
      userCreated = enterprise;
    } else {
      userCreated = admin;
    }

    try {
      resultCreateUser = await userUsecase.create(user: userCreated);
    } catch (e) {
      asuka.showSnackBar(SnackBar(content: Text(e.toString())));
    }

    if (resultCreateUser!.isSuccess()) {
      if (userCreated is Candidate)
        Modular.to.pushNamedAndRemoveUntil('/home-candidato', ModalRoute.withName('/login'));
      else if (userCreated is Enterprise)
        Modular.to.pushNamedAndRemoveUntil('/home-empresa', ModalRoute.withName('/login'));
      else if (userCreated is Admin) Modular.to.pushNamedAndRemoveUntil('/home-empresa', ModalRoute.withName('/login'));
    }

    await loading.hide();
  }
}

      // authStore.setUser(user);
      // // Modular.to.pushNamedAndRemoveUntil(
      // //     '/navigation', ModalRoute.withName('/navigation'));
      // Modular.to.pushNamed('/home/area-logada/pagina-home');
