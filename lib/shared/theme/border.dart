import 'package:flutter/material.dart';

class BorderTheme {
  /// Border com width 1px (border-width-100)
  // static Border Function({Color color}) w100 = (
  //         {Color color = ColorsTheme.neutral300}) =>
  //     Border.all(width: 1, color: color);

  // /// Border com width 2px (border-width-200)
  // static Border Function({Color? color}) w200 = (
  //         {Color? color = ColorsTheme.neutral300}) =>
  //     Border.all(width: 2, color: color!);

  /// Border radius 0 (border-radius-none)
  static BorderRadius none = BorderRadius.circular(0);

  /// Border radius com 3px (border-radius-100)
  static BorderRadius r100 = BorderRadius.circular(3);

  /// Border radius com 30px (border-radius-900)
  static BorderRadius r900 = BorderRadius.circular(30);
}
