// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AuthStore = BindInject(
  (i) => AuthStore(i<GetLoggedUser>(), i<Logout>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged => (_$isLoggedComputed ??=
          Computed<bool>(() => super.isLogged, name: '_AuthStoreBase.isLogged'))
      .value;

  final _$userAtom = Atom(name: '_AuthStoreBase.user');

  @override
  LoggedUserInfo? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(LoggedUserInfo? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$userDataAtom = Atom(name: '_AuthStoreBase.userData');

  @override
  User? get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(User? value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
    });
  }

  final _$listaVagasAtom = Atom(name: '_AuthStoreBase.listaVagas');

  @override
  List<Vacancy> get listaVagas {
    _$listaVagasAtom.reportRead();
    return super.listaVagas;
  }

  @override
  set listaVagas(List<Vacancy> value) {
    _$listaVagasAtom.reportWrite(value, super.listaVagas, () {
      super.listaVagas = value;
    });
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  void setUser(LoggedUserInfo? value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
userData: ${userData},
listaVagas: ${listaVagas},
isLogged: ${isLogged}
    ''';
  }
}
