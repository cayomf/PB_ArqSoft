import 'dart:ui';

import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ventura_hr/shared/theme/colors.dart';

part 'loading_dialog.g.dart';

abstract class LoadingDialog {
  void show();
  Future<void> hide();
}

@Injectable()
class LoadingDialogImpl implements LoadingDialog {
  OverlayEntry? _entry;

  LoadingDialogImpl() {
    _entry = OverlayEntry(
      builder: (context) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 15,
                  sigmaY: 15,
                ),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white.withOpacity(.55)),
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    strokeWidth: 8,
                    valueColor: AlwaysStoppedAnimation<Color>(ColorsTheme.support300),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Future<void> hide() async {
    _entry!.remove();
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  void show() {
    FocusManager.instance.primaryFocus!.unfocus();
    asuka.addOverlay(_entry!);
  }
}
