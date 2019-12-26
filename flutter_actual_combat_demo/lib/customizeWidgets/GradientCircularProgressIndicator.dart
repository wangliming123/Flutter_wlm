import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_actual_combat_demo/customizeWidgets/TurnBox.dart';

class GradientCircularProgressIndicator extends StatelessWidget {
  final double strokeWidth; //粗细
  final double radius; //圆半径
  final bool strokeCapRound; //两端是否为圆角
  final double value; //当前进度，[0.0 - 1.0]
  final Color backgroundColor; //背景色
  final double totalAngle; //进度条总弧度，2*PI为整圆，小于2*PI则不是整圆
  final List<Color> colors; //渐变色数组
  final List<double> stops; //渐变色终止点，对应colors

  GradientCircularProgressIndicator({
    this.strokeWidth = 2.0,
    @required this.radius,
    this.strokeCapRound = false,
    this.value,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.totalAngle = 2 * pi,
    @required this.colors,
    this.stops,
  });

  @override
  Widget build(BuildContext context) {
    double _offset = 0.0;
    // 如果两端为圆⻆，则需要对起始位置进⾏调整，否则圆⻆部分会偏离起始位置
    // 下⾯调整的⻆度的计算公式是通过数学⼏何知识得出
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }
    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).accentColor;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
            strokeWidth: strokeWidth,
            strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius,
            colors: _colors),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double strokeWidth;
  final bool strokeCapRound;
  final double value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double radius;
  final List<double> stops;

  _GradientCircularProgressPainter({
    this.strokeWidth: 10.0,
    this.strokeCapRound: false,
    this.value,
    this.backgroundColor = const Color(0xFFEEEEEE),
    @required this.colors,
    this.total = 2 * pi,
    this.radius,
    this.stops,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius);
    }
    double _offset = strokeWidth / 2.0;
    double _value = value ?? 0.0;
    _value = _value.clamp(0.0, 1.0) * total;
    double _start = 0.0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }
    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    //先画背景
    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }

    //再画前景
    if (_value > 0) {
      paint.shader = SweepGradient(
        colors: colors,
        stops: stops,
        startAngle: 0.0,
        endAngle: _value,
      ).createShader(rect);
      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TestGradientProgress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GradientProgressState();
}

class _GradientProgressState extends State<TestGradientProgress>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    bool isForward = true;
    _controller.addStatusListener((state) {
      if (state == AnimationStatus.forward) {
        isForward = true;
      } else if (state == AnimationStatus.completed ||
          state == AnimationStatus.dismissed) {
        if (isForward) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      } else if (state == AnimationStatus.reverse) {
        isForward = false;
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GradientProgress")),
      body: SingleChildScrollView(
        child: Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 16.0,
                        children: <Widget>[
                          GradientCircularProgressIndicator(
                            radius: 50.0,
                            colors: [Colors.blue, Colors.blue],
                            strokeWidth: 3.0,
                            value: _controller.value,
                          ),
                          GradientCircularProgressIndicator(
                            radius: 50.0,
                            colors: [Colors.blue, Colors.red],
                            strokeWidth: 3.0,
                            value: _controller.value,
                          ),
                          GradientCircularProgressIndicator(
                            radius: 50.0,
                            colors: [Colors.red, Colors.blue, Colors.orange],
                            strokeWidth: 3.0,
                            value: _controller.value,
                          ),
                          GradientCircularProgressIndicator(
                            radius: 50.0,
                            colors: [Colors.teal, Colors.cyan, Colors.blue],
                            strokeWidth: 5.0,
                            strokeCapRound: true,
                            value: CurvedAnimation(
                                    parent: _controller,
                                    curve: Curves.decelerate)
                                .value,
                          ),
                          TurnBox(
                            turns: 1 / 8,
                            child: GradientCircularProgressIndicator(
                                radius: 50.0,
                                colors: [
                                  Colors.red,
                                  Colors.orange,
                                  Colors.blue
                                ],
                                strokeWidth: 5.0,
                                strokeCapRound: true,
                                backgroundColor: Colors.red[50],
                                totalAngle: 1.5 * pi,
                                value: CurvedAnimation(
                                        parent: _controller, curve: Curves.ease)
                                    .value),
                          ),
                          RotatedBox(
                              quarterTurns: 1,
                              child: GradientCircularProgressIndicator(
                                  radius: 50.0,
                                  colors: [Colors.blue[800], Colors.blue[200]],
                                  strokeWidth: 3.0,
                                  strokeCapRound: true,
                                  backgroundColor: Colors.transparent,
                                  value: _controller.value)),
                          GradientCircularProgressIndicator(
                            radius: 50.0,
                            colors: [
                              Colors.red,
                              Colors.orange,
                              Colors.yellow,
                              Colors.green,
                              Colors.blue,
                              Colors.purple
                            ],
                            strokeWidth: 5.0,
                            strokeCapRound: true,
                            value: _controller.value,
                          ),
                          GradientCircularProgressIndicator(
                            radius: 60.0,
                            colors: [Colors.red, Colors.blue],
                            strokeWidth: 10.0,
                            value: _controller.value,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: GradientCircularProgressIndicator(
                              radius: 60.0,
                              colors: [Colors.red, Colors.blue],
                              strokeWidth: 10.0,
                              value: _controller.value,
                              strokeCapRound: true,
                            ),
                          ),
                        ],
                      ),
                      ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.5,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: SizedBox(
//                              width: 100.0,
                              child: TurnBox(
                                turns: 0.75,
                                child: GradientCircularProgressIndicator(
                                  radius: 80.0,
                                  colors: [Colors.teal, Colors.cyan[200]],
                                  strokeWidth: 6.0,
                                  value: _controller.value,
                                  totalAngle: pi,
                                  strokeCapRound: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 200.0,
                        height: 104.0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Positioned(
                              height: 200.0,
                              top: 0.0,
                              child: TurnBox(
                                turns: 0.75,
                                child: GradientCircularProgressIndicator(
                                  radius: 100.0,
                                  colors: [Colors.teal, Colors.cyan[200]],
                                  strokeWidth: 6.0,
                                  strokeCapRound: true,
                                  totalAngle: pi,
                                  value: _controller.value,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "${(_controller.value * 100).toInt()}%",
                                style: TextStyle(fontSize: 25.0, color: Colors.blueGrey),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
