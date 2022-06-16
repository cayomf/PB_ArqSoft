import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ventura_hr/area-logada/domain/entities/admin.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/candidate.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/enterprise.entity.dart';
import 'package:ventura_hr/login-firebase/domain/entities/login_credential.dart';
import 'package:ventura_hr/login-firebase/presenter/utils/loading_dialog.dart';

part 'signup.controller.g.dart';

@Injectable()
class SignupController = _SignupControllerBase with _$SignupController;

enum TipoConta { candidato, empresa }

abstract class _SignupControllerBase with Store {
  final LoadingDialog loading;

  _SignupControllerBase(this.loading);

  // @observable
  // User user = const User(
  //   cep: '',
  //   complemento: '',
  //   email: '',
  //   nome: '',
  //   telefone: '',
  // );

  @observable
  TipoConta? tipoConta;

  @observable
  Admin admin = Admin(
    adminId: "",
  );

  @observable
  Candidate candidate = Candidate(
    cpf: '',
  );

  @observable
  Enterprise enterprise = Enterprise(
    cnpj: '',
  );

  @observable
  String email = '';

  @observable
  String password = '';

  @action
  updateAdmin({
    String? cep,
    String? complemento,
    String? email,
    String? telefone,
    String? adminId,
    String? nome,
  }) {
    admin = Admin(
      cep: cep ?? admin.cep,
      email: email ?? admin.email,
      complemento: complemento ?? admin.complemento,
      telefone: telefone ?? admin.telefone,
      adminId: adminId ?? admin.adminId,
      nome: nome ?? admin.nome,
    );
  }

  @action
  updateEnterprise({
    String? cep,
    String? complemento,
    String? email,
    String? telefone,
    String? cnpj,
    String? nome,
  }) {
    enterprise = Enterprise(
      cep: cep ?? enterprise.cep,
      email: email ?? enterprise.email,
      complemento: complemento ?? enterprise.complemento,
      telefone: telefone ?? enterprise.telefone,
      cnpj: cnpj ?? enterprise.cnpj,
      nome: nome ?? enterprise.nome,
    );
  }

  @action
  updateCandidate({
    String? cep,
    String? complemento,
    String? email,
    String? telefone,
    String? cpf,
    String? nome,
  }) {
    candidate = Candidate(
      cep: cep ?? candidate.cep,
      email: email ?? candidate.email,
      complemento: complemento ?? candidate.complemento,
      telefone: telefone ?? candidate.telefone,
      cpf: cpf ?? candidate.cpf,
      nome: nome ?? candidate.nome,
    );
  }

  @computed
  LoginCredential get credential => LoginCredential.withEmailAndPassword(email: email, password: password);

  @computed
  bool get isValid => credential.isValidEmail && credential.isValidPassword;

  signup() async {
    loading.show();
    // await Future.delayed(Duration(seconds: 1));
    // var result = await loginWithEmailUsecase(credential);
    // await loading.hide();
    // result.fold((failure) {
    //   asuka.showSnackBar(SnackBar(content: Text(failure.message!)));
    // }, (user) {
    //   authStore.setUser(user);
    //   // Modular.to.pushNamedAndRemoveUntil(
    //   //     '/navigation', ModalRoute.withName('/navigation'));
    //   Modular.to.pushNamed('/home/area-logada/pagina-home');
    // });
  }
}
