import 'package:flutter/material.dart';
import 'package:ventura_hr/shared/theme/colors.dart';
import 'package:ventura_hr/shared/theme/typography.dart';

enum CustomTexts {
  h1,
  h1Bold,
  h2Bold,
  h2Regular,
  h3Bold,
  h3Regular,
  subtitleBold,
  subtitleRegular16,
  subtitleRegular14,
  paragraphBold18,
  paragraphBold16,
  paragraphBold14,
  paragraphRegular18,
  paragraphRegular16,
  paragraphRegular14,
}

class CustomText extends StatelessWidget {
  final CustomTexts type;
  final Color color;
  final String text;
  final Function? callback;
  final int maxLines;
  final TextAlign textAlign;
  final TextOverflow overflow;
  const CustomText({
    Key? key,
    required this.type,
    required this.text,
    this.callback,
    this.color = ColorsTheme.primary400,
    this.overflow = TextOverflow.visible,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Text build(BuildContext context) {
    return Text(text,
        overflow: overflow,
        maxLines: maxLines,
        softWrap: true,
        style: getTextStyle(type),
        textAlign: textAlign,
        textDirection: TextDirection.ltr);
  }

  TextStyle getTextStyle(CustomTexts type) {
    switch (type) {
      case CustomTexts.h1:
        return TypographyTheme.h1(color: color);
      case CustomTexts.h1Bold:
        return TypographyTheme.h1Bold(color: color);
      case CustomTexts.h2Bold:
        return TypographyTheme.h2Bold(color: color);
      case CustomTexts.h2Regular:
        return TypographyTheme.h2Regular(color: color);
      case CustomTexts.h3Bold:
        return TypographyTheme.h3Bold(color: color);
      case CustomTexts.h3Regular:
        return TypographyTheme.h3Regular(color: color);
      case CustomTexts.subtitleBold:
        return TypographyTheme.subtitleBold(color: color);
      case CustomTexts.subtitleRegular16:
        return TypographyTheme.subtitleRegular16(color: color);
      case CustomTexts.subtitleRegular14:
        return TypographyTheme.subtitleRegular14(color: color);
      case CustomTexts.paragraphBold18:
        return TypographyTheme.paragraphBold18(color: color);
      case CustomTexts.paragraphBold16:
        return TypographyTheme.paragraphBold16(color: color);
      case CustomTexts.paragraphBold14:
        return TypographyTheme.paragraphBold14(color: color);
      case CustomTexts.paragraphRegular18:
        return TypographyTheme.paragraphRegular18(color: color);
      case CustomTexts.paragraphRegular16:
        return TypographyTheme.paragraphRegular16(color: color);
      case CustomTexts.paragraphRegular14:
        return TypographyTheme.paragraphRegular14(color: color);
      default:
        return TypographyTheme.h1(color: color);
    }
  }
}
