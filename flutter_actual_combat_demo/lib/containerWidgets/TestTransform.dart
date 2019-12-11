import 'package:flutter/material.dart';
import 'dart:math' as math;

class TestTransform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("变换Transform")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 50.0, bottom: 20.0),
            child: Container(
                color: Colors.black,
                child: Transform(
                    alignment: Alignment.topRight, //相对于坐标系原点的对⻬⽅式
                    transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                    child: Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.deepOrange,
                        child: Text("Apartment for rent!")))),
          ),
          // Transform的变换是应⽤在绘制阶段，⽽并不是应⽤在布局(layout)阶段，
          // 所以⽆论对⼦widget应⽤何种变化，其占⽤空间的⼤⼩和在屏幕上的位置都是固定不变的，
          // 因为这些是在布局阶段就确定的
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.translate(
                offset: Offset(-20.0, -5.0), child: Text("hello World!")),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                  angle: math.pi / 2, child: Text("Hello World!")),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(scale: 2.0, child: Text("Hello World!")),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // RotatedBox和Transform.rotate功能相似，它们都可以对⼦widget进⾏旋转变换，
              // 但是有⼀点不同：RotatedBox的变换是在layout阶段，会影响在⼦widget的位置和⼤⼩
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: RotatedBox(
                    quarterTurns: 1, //旋转90度
                    child: Text("Hello World!")),
              )
            ],
          )
        ],
      ),
    );
  }
}
