import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
// ignore: implementation_imports

class ModularService {
  ModularService() {}

  Type? inject<Type extends Object>() {
    return Modular.get<Type>();
  }

  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments, bool forRoot = false}) {
    return Modular.to.pushNamed(routeName, arguments: arguments, forRoot: forRoot);
  }

  navigate<T extends Object?>(String routeName, {Object? arguments}) {
    return Modular.to.navigate(routeName, arguments: arguments);
  }

  String getCurrentRoute<T extends Object?>() {
    return Modular.to.path;
  }

  void pop<T>([T? value]) {
    return Modular.to.pop(value);
  }

  void popUntil(String route) {
    return Modular.to.popUntil(ModalRoute.withName(route));
  }

  void popUntilAndPushNamed(String removeUntilRoute, String newRoute) {
    Modular.to.popUntil(ModalRoute.withName(removeUntilRoute));
    Modular.to.pushNamed(newRoute);
  }

  void popRepeatedly({required int pagesToGoBack}) {
    for (var i = 0; i < pagesToGoBack; i++) {
      if (Modular.to.canPop()) {
        Modular.to.pop();
      }
    }
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Modular.to.pushReplacementNamed(routeName, arguments: arguments);
  }

  void pushNamedAndRemoveUntil(String newRoute, String oldRoute, {Object? arguments}) {
    Modular.to.pushNamedAndRemoveUntil(newRoute, ModalRoute.withName(oldRoute), arguments: arguments);
  }

  void removeAndPushNamed(String newRoute, String oldRoute) {
    Modular.to.navigate(newRoute);
  }

  void goBackThenPushNamed(String newRoute, {required int pagesToGoBack}) {
    for (var i = 0; i < pagesToGoBack; i++) {
      if (Modular.to.canPop()) {
        Modular.to.pop();
      }
    }
    Modular.to.pushNamed(newRoute);
  }

  void goBackThenReload({required int pagesToGoBack}) {
    for (var i = 0; i < pagesToGoBack; i++) {
      if (Modular.to.canPop()) {
        Modular.to.pop();
      }
    }
    Modular.to.pushReplacementNamed('.');
  }
}
