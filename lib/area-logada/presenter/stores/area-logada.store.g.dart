// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area-logada.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AreaLogadaStore on AreaLogadaStoreBase, Store {
  final _$usuarioAtom = Atom(name: 'AreaLogadaStoreBase.usuario');

  @override
  User? get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(User? value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  final _$vacanciesAtom = Atom(name: 'AreaLogadaStoreBase.vacancies');

  @override
  List<Vacancy>? get vacancies {
    _$vacanciesAtom.reportRead();
    return super.vacancies;
  }

  @override
  set vacancies(List<Vacancy>? value) {
    _$vacanciesAtom.reportWrite(value, super.vacancies, () {
      super.vacancies = value;
    });
  }

  final _$isVagasLoadedAtom = Atom(name: 'AreaLogadaStoreBase.isVagasLoaded');

  @override
  bool get isVagasLoaded {
    _$isVagasLoadedAtom.reportRead();
    return super.isVagasLoaded;
  }

  @override
  set isVagasLoaded(bool value) {
    _$isVagasLoadedAtom.reportWrite(value, super.isVagasLoaded, () {
      super.isVagasLoaded = value;
    });
  }

  final _$vacancyAtom = Atom(name: 'AreaLogadaStoreBase.vacancy');

  @override
  Vacancy? get vacancy {
    _$vacancyAtom.reportRead();
    return super.vacancy;
  }

  @override
  set vacancy(Vacancy? value) {
    _$vacancyAtom.reportWrite(value, super.vacancy, () {
      super.vacancy = value;
    });
  }

  final _$candidacyAtom = Atom(name: 'AreaLogadaStoreBase.candidacy');

  @override
  Candidacy? get candidacy {
    _$candidacyAtom.reportRead();
    return super.candidacy;
  }

  @override
  set candidacy(Candidacy? value) {
    _$candidacyAtom.reportWrite(value, super.candidacy, () {
      super.candidacy = value;
    });
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
vacancies: ${vacancies},
isVagasLoaded: ${isVagasLoaded},
vacancy: ${vacancy},
candidacy: ${candidacy}
    ''';
  }
}
