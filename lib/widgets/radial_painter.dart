import 'dart:math';

import 'package:flutter/material.dart';

class RadialPainter extends CustomPainter {
  final Color? bgColor;
  final Color? lineColor;
  final double? percent;
  final double? width;

  RadialPainter({
    this.bgColor,
    this.lineColor,
    this.percent,
    this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint pgLine = Paint()
      ..color = bgColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    Paint completeLine = Paint()
      ..color = lineColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.height / 3, size.width / 3);
    canvas.drawCircle(center, radius, pgLine);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi/2,
      2*pi*percent!,
      false,
        completeLine,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
