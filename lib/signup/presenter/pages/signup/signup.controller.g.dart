// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup.controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SignupController = BindInject(
  (i) => SignupController(i<LoginWithEmail>(), i<AuthStore>(),
      i<RegisterUser>(), i<LoadingDialog>(), i<UserUsecase>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupController on _SignupControllerBase, Store {
  Computed<LoginCredential>? _$credentialComputed;

  @override
  LoginCredential get credential => (_$credentialComputed ??=
          Computed<LoginCredential>(() => super.credential,
              name: '_SignupControllerBase.credential'))
      .value;
  Computed<bool>? _$isCredentialsValidComputed;

  @override
  bool get isCredentialsValid => (_$isCredentialsValidComputed ??=
          Computed<bool>(() => super.isCredentialsValid,
              name: '_SignupControllerBase.isCredentialsValid'))
      .value;

  final _$tipoContaAtom = Atom(name: '_SignupControllerBase.tipoConta');

  @override
  TipoConta? get tipoConta {
    _$tipoContaAtom.reportRead();
    return super.tipoConta;
  }

  @override
  set tipoConta(TipoConta? value) {
    _$tipoContaAtom.reportWrite(value, super.tipoConta, () {
      super.tipoConta = value;
    });
  }

  final _$adminAtom = Atom(name: '_SignupControllerBase.admin');

  @override
  Admin get admin {
    _$adminAtom.reportRead();
    return super.admin;
  }

  @override
  set admin(Admin value) {
    _$adminAtom.reportWrite(value, super.admin, () {
      super.admin = value;
    });
  }

  final _$candidateAtom = Atom(name: '_SignupControllerBase.candidate');

  @override
  Candidate get candidate {
    _$candidateAtom.reportRead();
    return super.candidate;
  }

  @override
  set candidate(Candidate value) {
    _$candidateAtom.reportWrite(value, super.candidate, () {
      super.candidate = value;
    });
  }

  final _$enterpriseAtom = Atom(name: '_SignupControllerBase.enterprise');

  @override
  Enterprise get enterprise {
    _$enterpriseAtom.reportRead();
    return super.enterprise;
  }

  @override
  set enterprise(Enterprise value) {
    _$enterpriseAtom.reportWrite(value, super.enterprise, () {
      super.enterprise = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignupControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignupControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$_SignupControllerBaseActionController =
      ActionController(name: '_SignupControllerBase');

  @override
  dynamic updateAdmin(
      {String? endereco,
      String? email,
      String? telefone,
      String? adminId,
      String? nome}) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.updateAdmin');
    try {
      return super.updateAdmin(
          endereco: endereco,
          email: email,
          telefone: telefone,
          adminId: adminId,
          nome: nome);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateEnterprise(
      {String? endereco,
      String? email,
      String? telefone,
      String? cnpj,
      String? nome}) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.updateEnterprise');
    try {
      return super.updateEnterprise(
          endereco: endereco,
          email: email,
          telefone: telefone,
          cnpj: cnpj,
          nome: nome);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateCandidate(
      {String? endereco,
      String? email,
      String? telefone,
      String? cpf,
      String? nome}) {
    final _$actionInfo = _$_SignupControllerBaseActionController.startAction(
        name: '_SignupControllerBase.updateCandidate');
    try {
      return super.updateCandidate(
          endereco: endereco,
          email: email,
          telefone: telefone,
          cpf: cpf,
          nome: nome);
    } finally {
      _$_SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoConta: ${tipoConta},
admin: ${admin},
candidate: ${candidate},
enterprise: ${enterprise},
email: ${email},
password: ${password},
credential: ${credential},
isCredentialsValid: ${isCredentialsValid}
    ''';
  }
}
