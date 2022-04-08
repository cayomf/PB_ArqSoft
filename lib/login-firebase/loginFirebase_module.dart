import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/login-firebase/presenter/pages/phone_login/phone_login_controller.dart';
import 'package:ventura_hr/login-firebase/presenter/pages/register/register_controller.dart';
import 'package:ventura_hr/login-firebase/presenter/pages/verify_code/verify_code_controller.dart';

import 'domain/usecases/get_logged_user.dart';
import 'domain/usecases/login_with_email.dart';
import 'domain/usecases/login_with_phone.dart';
import 'domain/usecases/logout.dart';
import 'domain/usecases/register_user.dart';
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
    $RegisterUserImpl,
    $LoginWithEmailImpl,
    $VerifyPhoneCodeImpl,
    $LoginWithPhoneImpl,
    $LoadingDialogImpl,
    $FlutterConnectivityDriver,
    $ConnectivityServiceImpl,
    $LoginController,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (context, args) => LoginPage()),
    // ChildRoute(
    //   '/entrar',
    //   child: (context, args) => LoginWidget(),
    //   children: [
    //     ChildRoute(
    //       '/pagina-home',
    //       child: (_, __) => HomePage(),
    //     ),
    //     ChildRoute(
    //       '/pagina-login',
    //       child: (_, __) => LoginPage(),
    //     ),
    //   ],
    // ),
    ChildRoute("/phone", child: (context, args) => PhoneLoginPage()),
    ChildRoute("/verify/:verificationId", child: (context, args) => VerifyCodePage()),
    ChildRoute("/register", child: (context, args) => RegisterPage()),
  ];
}
