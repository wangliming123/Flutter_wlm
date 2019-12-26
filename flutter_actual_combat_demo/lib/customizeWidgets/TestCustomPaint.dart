import 'dart:math';

import 'package:flutter/material.dart';

class TestCustomPaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CustomPaint")),
      body: Center(
        child: CustomPaint(
          size: Size(300.0, 300.0),
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Color(0x77cdb175);
    //画棋盘背景
    canvas.drawRect(Offset.zero & size, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.black87
      ..strokeWidth = 1.0;
    //画棋盘⽹格
    for (int i = 0; i <= 15; i++) {
      double dy = eHeight * i;
      double dx = eWidth * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint); //横线
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint); //竖线
    }

    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    //画黑子
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 + eHeight / 2),
      min(eWidth / 2, eHeight / 2),
      paint,
    );
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    //在实际场景中正确利⽤此回调可以避免重绘开销，本示例我们简单的返回true
    return true;
  }
}
