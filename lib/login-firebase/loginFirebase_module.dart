import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/area-logada/domain/repositories/vacancy.repository.dart';
import 'package:ventura_hr/area-logada/domain/usecases/vacancy/vacancy.usecase.dart';
import 'package:ventura_hr/area-logada/domain/usecases/vacancy/vacancy.usecase_impl.dart';
import 'package:ventura_hr/area-logada/external/repositories/vacancy.repository_impl.dart';
import 'package:ventura_hr/area-logada/presenter/pages/homes/admin-home/admin-home.page.dart';
import 'package:ventura_hr/area-logada/presenter/pages/homes/candidate-home/candidate-home.page.dart';
import 'package:ventura_hr/area-logada/presenter/pages/homes/enterprise-home/enterprise-home.page.dart';
import 'package:ventura_hr/login-firebase/presenter/pages/phone_login/phone_login_controller.dart';
import 'package:ventura_hr/login-firebase/presenter/pages/register/register_controller.dart';
import 'package:ventura_hr/login-firebase/presenter/pages/verify_code/verify_code_controller.dart';
import 'package:ventura_hr/shared/services/dio.service.dart';
import 'package:ventura_hr/shared/services/modular.service.dart';
import 'package:ventura_hr/shared/stores/auth_store.dart';
import 'package:ventura_hr/signup/domain/repositories/user.repository.dart';
import 'package:ventura_hr/signup/domain/usecases/user.usecase.dart';
import 'package:ventura_hr/signup/domain/usecases/user.usecase_impl.dart';

import 'domain/usecases/get_logged_user.dart';
import 'domain/usecases/login_with_phone.dart';
import 'domain/usecases/logout.dart';
import 'domain/usecases/verify_phone_code.dart';
import 'external/datasources/firebase_datasource.dart';
import 'external/drivers/flutter_connectivity_driver_impl.dart';
import 'infra/repositories/login_repository_impl.dart';
import 'infra/services/connectivity_service_impl.dart';
import 'presenter/pages/login/login_controller.dart';
import 'presenter/pages/login/login_page.dart';
import 'presenter/pages/phone_login/phone_login_page.dart';
import 'presenter/pages/register/register_page.dart';
import 'presenter/pages/verify_code/verify_code_page.dart';
import 'presenter/utils/loading_dialog.dart';

class LoginFirebaseModule extends Module {
  static List<Bind> export = [
    $GetLoggedUserImpl,
    $LogoutImpl,
    $LoginRepositoryImpl,
    $FirebaseDataSourceImpl,
  ];

  @override
  final List<Bind> binds = [
    Bind((_) => Connectivity()),
    $VerifyCodeController,
    $PhoneLoginController,
    $RegisterController,
    $VerifyPhoneCodeImpl,
    $LoginWithPhoneImpl,
    $LoadingDialogImpl,
    $FlutterConnectivityDriver,
    $ConnectivityServiceImpl,
    $LoginController,
    BindInject<UserUsecase>(
      (inject) => UserUsecaseImpl(
        inject<UserRepository>(),
      ),
      isSingleton: false,
    ),
    BindInject<VacancyUsecase>(
      (inject) => VacancyUsecaseImpl(
        inject<VacancyRepository>(),
      ),
      isSingleton: false,
    ),
    BindInject<VacancyRepository>(
      (inject) => VacancyRepositoryImpl(inject<DioService>()),
      isSingleton: false,
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => LoginPage(
              modularService: Modular.get<ModularService>(),
            )),
    ChildRoute("/phone", child: (context, args) => PhoneLoginPage()),
    ChildRoute("/verify/:verificationId", child: (context, args) => VerifyCodePage()),
    ChildRoute("/home-candidato",
        child: (_, __) => CandidateHomePage(
              authStore: Modular.get<AuthStore>(),
              vacancyUsecase: Modular.get<VacancyUsecase>(),
            )),
    ChildRoute("/home-admin", child: (_, __) => AdminHomePage()),
    ChildRoute("/home-empresa", child: (_, __) => EnterpriseHomePage()),
    ChildRoute("/register",
        child: (context, args) => RegisterPage(
              modularService: Modular.get<ModularService>(),
            )),
  ];
}
