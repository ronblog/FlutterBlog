import 'package:flutter/material.dart';
//1
class BG1Painter extends CustomPainter {
  //2
  BG1Painter(Colors color)
  {

  }

  //3
  Color color = Colors.white24;

  //4
  @override
  void paint(Canvas canvas, Size size) {}

  //5
  @override
  bool shouldRepaint(BG1Painter oldDelegate) {
    return color != oldDelegate.color;
  }
}
