import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/shared/helper/utils.helper.dart';
import 'package:ventura_hr/shared/theme/colors.dart';
import 'package:ventura_hr/shared/widgets/buttons/button-types.dart';
import 'package:ventura_hr/shared/widgets/buttons/button.dart';
import 'package:ventura_hr/shared/widgets/custom-text/custom-text.widget.dart';

enum ThemeAppBar { white, blue, red }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double toolbarHeight;
  final List<IconButton> actionButtons;
  final ThemeAppBar theme;
  final String title;
  final bool centerTitle;
  final bool showBackButton;
  final Widget? leading;
  final String backButtonRoute;

  CustomAppBar({
    this.toolbarHeight = 56,
    required this.theme,
    this.actionButtons = const <IconButton>[],
    required this.title,
    this.showBackButton = true,
    this.leading,
    this.centerTitle = true,
    this.backButtonRoute = '',
  });

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(
        color: getThemeText(), //change your color here
      ),
      automaticallyImplyLeading: showBackButton,
      backgroundColor: getThemeBackground(),
      centerTitle: centerTitle,
      titleSpacing: 90,
      brightness: getThemeBrightness(),
      leading: !showBackButton ? leading : getBackButton(context),
      title: CustomText(
        type: CustomTexts.h3Regular,
        text: title,
        maxLines: 2,
        color: getThemeText(),
        textAlign: TextAlign.center,
      ),
      actions: actionButtons,
      actionsIconTheme: IconThemeData(color: getThemeText()),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(getToolbarHeight());

  double getToolbarHeight() {
    if (Utils.exceedsMaxLines(styleText: CustomTexts.h3Regular, text: title, maxWidth: 237)) {
      return 70.0;
    }
    return toolbarHeight;
  }

  Color getThemeBackground() {
    switch (theme) {
      case ThemeAppBar.blue:
        return ColorsTheme.primary400;
      case ThemeAppBar.white:
        return ColorsTheme.neutral900;
      default:
        return ColorsTheme.primary400;
    }
  }

  Color getThemeText() {
    switch (theme) {
      case ThemeAppBar.blue:
        return ColorsTheme.neutral900;
      case ThemeAppBar.white:
        return Colors.red[900]!;
      default:
        return ColorsTheme.neutral900;
    }
  }

  Brightness getThemeBrightness() {
    switch (theme) {
      case ThemeAppBar.blue:
        return Brightness.dark;
      case ThemeAppBar.white:
        return Brightness.light;
      default:
        return Brightness.light;
    }
  }

  Button getBackButton(BuildContext context) {
    return Button(
      isDisabled: false,
      type: ButtonTypes.iconButton,
      icon: Icon(Icons.arrow_back),
      iconColor: getThemeText(),
      onPressed: () {
        print(backButtonRoute);
        Navigator.of(context).pushNamed(backButtonRoute);
      },
    );
  }
}
