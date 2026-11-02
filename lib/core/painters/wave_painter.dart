import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final Color blueNight;
  final Color khaki;

  WavePainter({required this.blueNight, required this.khaki});

  @override
  void paint(Canvas canvas, Size size) {
    final paintKhaki = Paint()
      ..color = khaki
      ..style = PaintingStyle.fill;

    final pathKhaki = Path();
    pathKhaki.moveTo(0, size.height * 0.45);
    pathKhaki.quadraticBezierTo(
      size.width * 0.4,
      size.height * 1.1,
      size.width,
      size.height * 0.55,
    );
    pathKhaki.lineTo(size.width, size.height);
    pathKhaki.lineTo(0, size.height);
    pathKhaki.close();
    canvas.drawPath(pathKhaki, paintKhaki);

    final paintBlue = Paint()
      ..color = blueNight
      ..style = PaintingStyle.fill;

    final pathBlue = Path();
    pathBlue.moveTo(0, size.height * 0.65);
    pathBlue.quadraticBezierTo(
      size.width * 0.45,
      size.height * 1.15,
      size.width,
      size.height * 0.8,
    );
    pathBlue.lineTo(size.width, size.height);
    pathBlue.lineTo(0, size.height);
    pathBlue.close();
    canvas.drawPath(pathBlue, paintBlue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}