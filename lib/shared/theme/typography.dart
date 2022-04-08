import 'package:flutter/cupertino.dart';
import 'package:ventura_hr/shared/theme/colors.dart';
import 'package:ventura_hr/shared/theme/font-size.dart';
import 'package:ventura_hr/shared/theme/font-weight.dart';
import 'package:ventura_hr/shared/theme/letter-spacing.dart';
import 'package:ventura_hr/shared/theme/line-height.dart';

class TypographyTheme {
  static TextStyle h1({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w700,
      fontSize: FontSizeTheme.fontSize800,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize800));

  static TextStyle h1Bold({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w700,
      fontSize: FontSizeTheme.fontSize800,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight600(FontSizeTheme.fontSize800));

  static TextStyle h2Bold({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w700,
      fontSize: FontSizeTheme.fontSize700,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight600(FontSizeTheme.fontSize700));

  static TextStyle h2Regular({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w400,
      fontSize: FontSizeTheme.fontSize700,
      fontStyle: FontStyle.normal,
      letterSpacing: 0.18,
      height: LineHeightTheme.lineHeight600(FontSizeTheme.fontSize700));

  static TextStyle h3Bold({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w700,
      fontSize: FontSizeTheme.fontSize600,
      fontStyle: FontStyle.normal,
      letterSpacing: LetterSpacingTheme.spacing500,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize600));

  static TextStyle h3Regular({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w400,
      fontSize: FontSizeTheme.fontSize600,
      fontStyle: FontStyle.normal,
      letterSpacing: LetterSpacingTheme.spacing500,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize600));

  static TextStyle subtitleBold({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w700,
      fontSize: FontSizeTheme.fontSize400,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize400));

  static TextStyle subtitleRegular16({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w400,
      fontSize: FontSizeTheme.fontSize400,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize400));

  static TextStyle subtitleRegular14({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w400,
      fontSize: FontSizeTheme.fontSize300,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize300),
      letterSpacing: LetterSpacingTheme.spacing500);

  static TextStyle paragraphBold18({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w700,
      fontSize: FontSizeTheme.fontSize500,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize500));

  static TextStyle paragraphBold16({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w700,
      fontSize: FontSizeTheme.fontSize400,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize400));

  static TextStyle paragraphBold14({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w700,
      fontSize: FontSizeTheme.fontSize300,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize400),
      letterSpacing: LetterSpacingTheme.spacing500);

  static TextStyle paragraphRegular18({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w400,
      fontSize: FontSizeTheme.fontSize500,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize500));

  static TextStyle paragraphRegular16({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w400,
      fontSize: FontSizeTheme.fontSize400,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize400));

  static TextStyle paragraphRegular14({Color color = ColorsTheme.primary400}) => TextStyle(
      color: color,
      fontWeight: FontWeightTheme.w400,
      fontSize: FontSizeTheme.fontSize300,
      fontStyle: FontStyle.normal,
      height: LineHeightTheme.lineHeight400(FontSizeTheme.fontSize300),
      letterSpacing: LetterSpacingTheme.spacing500);
}
