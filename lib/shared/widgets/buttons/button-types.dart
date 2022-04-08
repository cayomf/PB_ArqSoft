import 'package:flutter/material.dart';
import 'package:ventura_hr/shared/theme/colors.dart';

class ButtonTypes {
  final bool? isLink;
  final bool? hasBorder;
  final bool? isIcon;
  final Color? defaultBorderColor;
  final Color? disabledBorderColor;
  final Color? defaultFontColor;
  final Color? pressedFontColor;
  final Color? disabledFontColor;
  final Color? defaultBackgroundColor;
  final Color? pressedBackgroundColor;
  final Color? pressedBorderColor;
  final Color? disabledBackgroundColor;
  final Color? iconColor;

  ButtonTypes({
    Key? key,
    @required this.isLink,
    @required this.hasBorder,
    @required this.isIcon,
    this.defaultBorderColor,
    this.disabledBorderColor,
    this.defaultFontColor,
    this.pressedFontColor,
    this.disabledFontColor,
    this.defaultBackgroundColor,
    this.pressedBackgroundColor,
    this.disabledBackgroundColor,
    this.pressedBorderColor,
    this.iconColor,
  });

  static final ButtonTypes primaryButton = new ButtonTypes(
    isLink: false,
    hasBorder: true,
    isIcon: false,
    defaultBorderColor: ColorsTheme.support300,
    disabledBorderColor: ColorsTheme.support300.withOpacity(0.4),
    defaultFontColor: ColorsTheme.support300,
    pressedFontColor: ColorsTheme.neutral900,
    disabledFontColor: ColorsTheme.support300.withOpacity(0.4),
    defaultBackgroundColor: ColorsTheme.neutral900,
    pressedBackgroundColor: ColorsTheme.support300,
    disabledBackgroundColor: ColorsTheme.neutral900,
    pressedBorderColor: ColorsTheme.support300,
  );

  static final ButtonTypes secondaryButton = new ButtonTypes(
      isLink: false,
      hasBorder: true,
      isIcon: false,
      defaultBorderColor: ColorsTheme.primary400,
      disabledBorderColor: ColorsTheme.primary400.withOpacity(0.4),
      defaultFontColor: ColorsTheme.primary400,
      pressedFontColor: ColorsTheme.neutral900,
      disabledFontColor: ColorsTheme.primary400.withOpacity(0.4),
      defaultBackgroundColor: ColorsTheme.neutral900,
      pressedBackgroundColor: ColorsTheme.primary400,
      disabledBackgroundColor: ColorsTheme.neutral900);

  static final ButtonTypes ghostButton = new ButtonTypes(
      isLink: false,
      hasBorder: false,
      isIcon: false,
      defaultFontColor: ColorsTheme.primary400,
      pressedFontColor: ColorsTheme.primary400,
      disabledFontColor: ColorsTheme.primary400.withOpacity(0.4),
      defaultBackgroundColor: Colors.transparent,
      pressedBackgroundColor: ColorsTheme.primary500,
      disabledBackgroundColor: Colors.transparent);

  static final ButtonTypes linkButton = new ButtonTypes(
      isLink: true,
      hasBorder: false,
      isIcon: false,
      defaultFontColor: ColorsTheme.secondary200,
      pressedFontColor: ColorsTheme.secondary100,
      disabledFontColor: ColorsTheme.secondary200.withOpacity(0.4),
      defaultBackgroundColor: Colors.transparent,
      pressedBackgroundColor: Colors.transparent,
      disabledBackgroundColor: Colors.transparent);

  static final ButtonTypes iconButton =
      new ButtonTypes(isLink: true, hasBorder: false, isIcon: true, iconColor: ColorsTheme.primary400);
}
