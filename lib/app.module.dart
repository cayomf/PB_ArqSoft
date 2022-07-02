import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/area-logada/presenter/pages/homes/admin-home/admin-home.page.dart';
import 'package:ventura_hr/area-logada/presenter/pages/homes/candidate-home/candidate-home.page.dart';
import 'package:ventura_hr/area-logada/presenter/pages/homes/enterprise-home/enterprise-home.page.dart';
import 'package:ventura_hr/area-logada/presenter/pages/vacancy-details/vacancy-details-candidate.page.dart';
import 'package:ventura_hr/area-logada/presenter/pages/vacancy-details/vacancy-details-enterprise.page.dart';
import 'package:ventura_hr/login-firebase/domain/usecases/get_logged_user.dart';
import 'package:ventura_hr/login-firebase/domain/usecases/login_with_email.dart';
import 'package:ventura_hr/login-firebase/domain/usecases/logout.dart';
import 'package:ventura_hr/login-firebase/domain/usecases/register_user.dart';
import 'package:ventura_hr/login-firebase/external/datasources/firebase_datasource.dart';
import 'package:ventura_hr/login-firebase/infra/repositories/login_repository_impl.dart';
import 'package:ventura_hr/login-firebase/loginFirebase_module.dart';
import 'package:ventura_hr/login-firebase/presenter/pages/register/register_page.dart';
import 'package:ventura_hr/shared/pages/splash_screen_page.dart';
import 'package:ventura_hr/shared/services/dio.service.dart';
import 'package:ventura_hr/shared/services/modular.service.dart';
import 'package:ventura_hr/signup/domain/repositories/user.repository.dart';
import 'package:ventura_hr/signup/domain/usecases/user.usecase.dart';
import 'package:ventura_hr/signup/domain/usecases/user.usecase_impl.dart';
import 'package:ventura_hr/signup/external/repositories/user.repository_impl.dart';
import 'package:ventura_hr/signup/presenter/pages/signup/signup.controller.dart';
import 'package:ventura_hr/signup/presenter/pages/signup/signup.page.dart';

import 'shared/stores/auth_store.dart';

class AppModule extends Module {
  static List<Bind> export = [
    $GetLoggedUserImpl,
    $LogoutImpl,
    $LoginRepositoryImpl,
    $FirebaseDataSourceImpl,
  ];

  @override
  final List<Bind> binds = [
    Bind<Dio>((e) => Dio(), isSingleton: false),
    ...LoginFirebaseModule.export,
    $AuthStore,
    Bind((i) => FirebaseAuth.instance),
    Bind<ModularService>((e) => ModularService(), isSingleton: true),
    BindInject<DioService>(
      (inject) => DioService(inject<Dio>()),
      isSingleton: false,
    ),
    $SignupController,
    $RegisterUserImpl,
    $LoginWithEmailImpl,
    BindInject<UserUsecase>(
      (inject) => UserUsecaseImpl(
        inject<UserRepository>(),
      ),
      isSingleton: false,
    ),
    BindInject<UserRepository>(
      (inject) => UserRepositoryImpl(inject<DioService>()),
      isSingleton: false,
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => SplashScreenPage()),
    ModuleRoute("/login", module: LoginFirebaseModule()),
    ChildRoute("/vaga-detalhes-candidato", child: (_, __) => VacancyDetailsCandidatePage()),
    ChildRoute("/vaga-detalhes-empresa", child: (_, __) => VacancyDetailsEnterprisePage()),
    ChildRoute("/cadastro",
        child: (_, __) => SignupPage(
              modularService: Modular.get<ModularService>(),
              dioService: Modular.get<DioService>(),
            )),
    ChildRoute("/criar-vaga",
        child: (_, __) => SignupPage(
              modularService: Modular.get<ModularService>(),
              dioService: Modular.get<DioService>(),
            )),
  ];
}
