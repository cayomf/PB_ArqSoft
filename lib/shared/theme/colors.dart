import 'package:flutter/material.dart';
class ColorsTheme {
  /// Cor primária #002044 (color-primary-300)
  static const Color primary300 = Color.fromRGBO(0, 32, 68, 1);
  
  /// Cor primária #002855 (color-primary-400)
  static const Color primary400 = Color.fromRGBO(0, 40, 85, 1);

  
  /// Cor primária #EBF0F8 (color-primary-500)
  static const Color primary500 = Color.fromRGBO(235, 240, 248, 1);

  /// Cor secundária #2D61C3 (color-secondary-100)
  static const Color secondary100 = Color.fromRGBO(45, 97, 195, 1);

  /// Cor secundária #3171EF (color-secondary-200)
  static const Color secondary200 = Color.fromRGBO(49, 113, 239, 1);


  /// Cor neutra #000000 (color-neutral-100)
  static const Color neutral100 = Color.fromRGBO(0, 0, 0, 1);

  /// Cor neutra #666666 (color-neutral-200)
  static const Color neutral200 = Color.fromRGBO(102, 102, 102, 1);
  /// Cor neutra #C7C9C7 (color-neutral-300)

  static const Color neutral300 = Color.fromRGBO(199, 201, 199, 1);

  /// Cor neutra #F2F2F2 (color-neutral-400)
  static const Color neutral400 = Color.fromRGBO(242, 242, 242, 1);

  /// Cor neutra #FFFFFF (color-neutral-900)
  static const Color neutral900 = Color.fromRGBO(255, 255, 255, 1);


  /// Cor suporte #25B785 (color-support-100)
  static const Color support100 = Color.fromRGBO(37, 183, 133, 1);

  /// Cor suporte #28C18D (color-support-150)
  static const Color support150 = Color.fromRGBO(40, 193, 141, 1);

  /// Cor suporte #426CA9 (color-support-200)
  static const Color support200 = Color.fromRGBO(66, 108, 169, 1);

  /// Cor suporte #C83BC3 (color-support-250)
  static const Color support250 = Color.fromRGBO(200, 59, 195, 1);

  /// Cor suporte #D23B3B (color-support-300)
  static const Color support300 = Color.fromRGBO(210, 59, 59, 1);

  /// Cor suporte #4E82E4 (color-support-350)
  static const Color support350 = Color.fromRGBO(78, 130, 228, 1);

  /// Cor suporte #8C95A7 (color-support-400)
  static const Color support400 = Color.fromRGBO(140, 149, 167, 1);

  /// Cor suporte #FCA736 (color-support-450)
  static const Color support450 = Color.fromRGBO(252, 167, 54, 1);

  /// Cor suporte #7CB495 (color-support-500)
  static const Color support500 = Color.fromRGBO(124, 180, 149, 1);

  /// Cor suporte #5FE5C7 (color-support-550)
  static const Color support550 = Color.fromRGBO(95, 229, 199, 1);

  /// Cor suporte #F9CC54 (color-support-600)
  static const Color support600 = Color.fromRGBO(249, 204, 84, 1);

  /// Cor suporte #8DB9CA (color-support-650)
  static const Color support650 = Color.fromRGBO(141, 185, 202, 1);

  /// Cor suporte #B388FF (color-support-700)
  static const Color support700 = Color.fromRGBO(179, 136, 255, 1);

  /// Cor suporte #D1D5DC (color-support-750)
  static const Color support750 = Color.fromRGBO(209, 213, 220, 1);

  static MaterialColor createMaterialColor(Color color) {
    List<double> strengths = <double>[.05];
    Map<int?, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch as Map<int, Color>);
  }
}
