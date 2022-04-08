import 'package:flutter/material.dart';
import 'package:ventura_hr/shared/widgets/custom-text/custom-text.widget.dart';

class Utils {
  /// Verifica se o texto `text` passado excede o limite de linhas.
  static bool exceedsMaxLines(
      {required CustomTexts styleText, required String text, int maxLines = 1, required double maxWidth}) {
    final span = TextSpan(
        text: text,
        style: CustomText(
          text: text,
          type: styleText,
        ).getTextStyle(styleText));
    final tp = TextPainter(text: span, maxLines: maxLines, textDirection: TextDirection.ltr);
    tp.layout(maxWidth: maxWidth);

    return tp.didExceedMaxLines;
  }

  static double clearMoneyMask(String valor) {
    if (valor.isEmpty) return 0;
    return double.parse(valor.replaceAll('R\$', '').replaceAll('.', '').replaceAll(',', '.'));
  }
}
