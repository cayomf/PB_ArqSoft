import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/login-firebase/loginFirebase_module.dart';
import 'package:ventura_hr/shared/pages/splash_screen_page.dart';

import 'shared/stores/auth_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...LoginFirebaseModule.export,
    $AuthStore,
    Bind((i) => FirebaseAuth.instance),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => SplashScreenPage()),
    ModuleRoute("/login", module: LoginFirebaseModule()),
    // ModuleRoute("/doctors", module: DoctorsModule()),
    // ModuleRoute("/chat", module: ChatModule()),
    // ModuleRoute("/navigation", module: NavigationModule()),
    // ModuleRoute("/home", module: HomeModule()),
    // ModuleRoute("/perfil", module: PerfilModule()),
    // ModuleRoute("/empresas", module: EmpresasModule()),
  ];
}
