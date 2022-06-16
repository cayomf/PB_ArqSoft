import 'package:flutter/material.dart';
import 'package:ventura_hr/shared/theme/border.dart';
import 'package:ventura_hr/shared/theme/colors.dart';

class InputRadio<T> extends StatelessWidget {
  final Function(T value) onChanged;
  final T value;
  final T? groupValue;
  final bool? disabled;

  const InputRadio(
      {Key? key, required this.onChanged, required this.value, this.disabled = false, required this.groupValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (disabled!) return;
        onChanged(value);
      },
      child: AnimatedContainer(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: getColor(),
          borderRadius: BorderRadius.circular(100),
        ),
        duration: const Duration(milliseconds: 150),
        child: const Center(
          // TODO: Adicionar widget de ícone correto.
          child: Icon(
            Icons.circle,
            size: 8,
            color: ColorsTheme.secondary100,
          ),
        ),
      ),
    );
  }

  bool isSelected() => value == groupValue;

  Color getColor() {
    if (!isSelected()) return Colors.transparent;

    return disabled! ? ColorsTheme.neutral300 : ColorsTheme.neutral900;
  }

  Color getBorderColor() {
    return isSelected() ? Colors.transparent : ColorsTheme.neutral300;
  }
}
