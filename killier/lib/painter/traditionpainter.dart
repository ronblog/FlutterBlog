import 'package:flutter/material.dart';
//1
class traditionPainter extends CustomPainter {
  //2
  traditionPainter()
  {

  }

  //3
  Color color = Colors.white24;

  //4
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800]!;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;

    {
      Rect myRect = const Offset(280.0, 20.0) & const Size(600.0, 300.0);
      canvas.drawRect(myRect, paint);

      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: 30,
      );
      final textSpan = TextSpan(
        text: '狼人区',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final xCenter = 480.0;
      final yCenter =25.0;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }

    {
      Rect myRect = const Offset(280.0, 340.0) & const Size(600.0, 300.0);
      canvas.drawRect(myRect, paint);

      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: 30,
      );
      final textSpan = TextSpan(
        text: '神职区',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final xCenter = 480.0;
      final yCenter =345.0;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }

    {
      Rect myRect = const Offset(280.0, 660.0) & const Size(600.0, 500.0);
      canvas.drawRect(myRect, paint);

      final textStyle = TextStyle(
        color: Colors.black,
        fontSize: 30,
      );
      final textSpan = TextSpan(
        text: '死人区',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final xCenter = 480.0;
      final yCenter =665.0;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }

    {
      final textStyle = TextStyle(
        color: Colors.red,
        fontSize: 24,
      );

      final textSpan = TextSpan(
        text: '杀手区',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final xCenter = 330.0;
      final yCenter =700.0;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }

    {
      final textStyle = TextStyle(
        color: Colors.red,
        fontSize: 24,
      );

      final textSpan = TextSpan(
        text: '神区',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final xCenter = 530.0;
      final yCenter =700.0;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }

    {
      final textStyle = TextStyle(
        color: Colors.red,
        fontSize: 24,
      );

      final textSpan = TextSpan(
        text: '民区',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: size.width,
      );
      final xCenter = 730.0;
      final yCenter =700.0;
      final offset = Offset(xCenter, yCenter);
      textPainter.paint(canvas, offset);
    }




  }

  //5
  @override
  bool shouldRepaint(traditionPainter oldDelegate) {
    return true;
  }
}
