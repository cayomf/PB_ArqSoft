import 'package:flutter/material.dart';
import 'package:ventura_hr/shared/theme/colors.dart';

import 'button-types.dart';

class Button extends StatefulWidget {
  final String? text;
  final Icon? icon;
  final Color? iconColor;
  final Function? onPressed;
  final ButtonTypes? type;
  final bool? isDisabled;

  Button(
      {Key? key,
      this.text,
      this.icon,
      this.iconColor,
      @required this.onPressed,
      @required this.type,
      @required this.isDisabled});

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  Color showButtonsFontColor(Set<MaterialState> states) {
    if (widget.isDisabled!) return widget.type!.disabledFontColor!;
    if (states.contains(MaterialState.pressed)) return widget.type!.pressedFontColor!;
    return widget.type!.defaultFontColor!;
  }

  Color showButtonsBackgroundColor(Set<MaterialState> states) {
    if (widget.isDisabled!) return widget.type!.disabledBackgroundColor!;
    if (states.contains(MaterialState.pressed)) return widget.type!.pressedBackgroundColor!;
    return widget.type!.defaultBackgroundColor!;
  }

  Color showButtonsBorderColor(Set<MaterialState> states) {
    if (widget.isDisabled!) return widget.type!.disabledFontColor!;
    if (states.contains(MaterialState.pressed)) return widget.type!.pressedFontColor!;
    return widget.type!.defaultFontColor!;
  }

  Widget showButton(Function onPressed) {
    return widget.type!.isIcon == true
        ? IconButton(
            icon: widget.icon!,
            color: widget.iconColor != null ? widget.iconColor : ColorsTheme.primary400,
            onPressed: () {},
          )
        : TextButton(
            onPressed: () {
              onPressed();
            },
            child: Center(
              child: Padding(
                padding: widget.type!.isLink! ? EdgeInsets.all(0) : EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: Text(
                  widget.text != null ? widget.text! : '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.height * 0.025),
                ),
              ),
            ),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: widget.type!.isLink!
                  ? null
                  : MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        return showButtonsBackgroundColor(states);
                      },
                    ),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  return showButtonsFontColor(states);
                },
              ),
              shape: widget.type!.hasBorder!
                  ? MaterialStateProperty.resolveWith<OutlinedBorder>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return RoundedRectangleBorder(
                            side: BorderSide(color: showButtonsBorderColor(states), width: 2.0),
                          );
                        return RoundedRectangleBorder(
                          side: BorderSide(color: showButtonsBorderColor(states), width: 2.0),
                        );
                      },
                    )
                  : null,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return showButton(widget.onPressed!);
  }
}
