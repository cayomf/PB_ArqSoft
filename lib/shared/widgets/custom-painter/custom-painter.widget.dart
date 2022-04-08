import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 243, 52, 33)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2091667, size.height * 0.3333333);
    path_0.lineTo(size.width * 0, size.height * 0);
    path_0.lineTo(size.width, size.height * 0);
    path_0.lineTo(size.width * 0.6666666, size.height * 0.5);
    path_0.lineTo(size.width * 0.3333333, size.height * 0.5);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
