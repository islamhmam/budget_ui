import 'package:budget_test/widgets/radial_painter.dart';
import 'package:flutter/material.dart';

class RadialScreen  extends StatefulWidget  {
  final double? height;
  String day;
   RadialScreen(this.day, this.height,);

  @override
  State<RadialScreen> createState() => _RadialScreenState();
}

class _RadialScreenState extends State<RadialScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        foregroundPainter: RadialPainter(
          width: 10,
          bgColor: Colors.grey,
          lineColor: Colors.blue,
          percent: .5,
        ),
      ),
    );
  }
}
