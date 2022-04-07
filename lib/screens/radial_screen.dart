// ignore_for_file: prefer_const_constructors

import 'package:budget_test/widgets/radial_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: CustomPaint(
        foregroundPainter: RadialPainter(
          bgColor: Colors.grey,
          lineColor: Colors.blue,
          percent: .2,
          width: 15.0,
        ),
        child: Center(
          child: Text(
            '%20',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
    ;
  }
}
