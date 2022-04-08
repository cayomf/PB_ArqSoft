import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/shared/stores/auth_store.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage() {
    AuthStore auth = Modular.get<AuthStore>();
    auth.checkLogin().then((v) {
      return Future.delayed(Duration(seconds: 1));
    }).then((value) {
      print(auth.isLogged);
      auth.isLogged ? Modular.to.pushNamed('home') : Modular.to.pushNamed('login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/medy-logo.png"),
      ),
    );
  }
}
