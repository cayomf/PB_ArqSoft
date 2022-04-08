import 'package:flutter/material.dart';

class ShadowTheme {

  /// Sombra zerada (shadow-zero)
  static const BoxShadow zero = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0),
    offset: Offset(0, 0),
    blurRadius: 0,
    spreadRadius: 0,
  );

  /// Sombra interna (shadow-inset-100)
  static const BoxShadow inset100 = BoxShadow(
    color: Color.fromRGBO(237, 237, 237, 1),
    offset: Offset(0, 2),
    blurRadius: 0,
    spreadRadius: 0,
  );

  /// Sombra externa (shadow-inset-100)
  static const BoxShadow outside100 = BoxShadow(
    color: Color.fromRGBO(208, 208, 208, 1),
    offset: Offset(0, 3),
    blurRadius: 4,
    spreadRadius: 0,
  );

  /// Sombra externa (shadow-inset-200)
  static const BoxShadow outside200 = BoxShadow(
    color: Color.fromRGBO(238, 238, 238, 1),
    offset: Offset(-6, 9),
    blurRadius: 19,
    spreadRadius: 0,
  );
}
