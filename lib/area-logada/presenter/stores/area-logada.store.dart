import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ventura_hr/area-logada/domain/entities/candidacy.entity.dart';
import 'package:ventura_hr/area-logada/domain/entities/vacancy.entity.dart';
import 'package:ventura_hr/signup/domain/entities/user.entity.dart';

part 'area-logada.store.g.dart';

class AreaLogadaStore = AreaLogadaStoreBase with _$AreaLogadaStore;

abstract class AreaLogadaStoreBase with Store {
  @observable
  User? usuario;

  @observable
  List<Vacancy>? vacancies;

  @observable
  bool isVagasLoaded = true;

  @observable
  Vacancy? vacancy;

  @observable
  Candidacy? candidacy;
}
