import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TestGesture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestGestureState();
}

class _TestGestureState extends State<TestGesture> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("手势识别GestureDetector")),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: double.infinity,
                  height: 100.0,
                  child:
                      Text(_operation, style: TextStyle(color: Colors.white)),
                ),
                onTap: () => updateText("Tap"),
                onDoubleTap: () => updateText("DoubleTap"),
                onLongPress: () => updateText("LongPress"),
              ),
              Container(
                width: double.infinity,
                height: 150.0,
                color: Colors.yellow[200],
                child: _Drag(),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 200.0,
                color: Colors.teal[200],
                child: _DragVertical(),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 300.0,
                child: _TestScaleGesture(),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 200.0,
                color: Colors.teal[200],
                child: _TestGestureRecognizer(),
              ),
            ],
          ),
        ));
  }

  updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

class _Drag extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestDragState();
}

class _TestDragState extends State<_Drag> {
  double _top = 0.0; //距离顶部的偏移
  double _left = 0.0; //距离左边的偏移
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("g")),
            //⼿指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印⼿指按下的位置(相对于屏幕)
              print("手指按下：${e.globalPosition}");
            },
            //⼿指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //⽤户⼿指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              //打印滑动结束时在x、y轴上的速度
              print("速度：${e.velocity}");
            },
          ),
        )
      ],
    );
  }
}

class _DragVertical extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
            child: CircleAvatar(child: Text("V")),
            //垂直⽅向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
          ),
        )
      ],
    );
  }
}

class _TestScaleGesture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleState();
}

class _ScaleState extends State<_TestScaleGesture> {
  double _width = 150.0; //通过修改图⽚宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Image.asset("assets/images/img_head.jpg", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            _width = 150 * details.scale.clamp(0.2, 5);
          });
        },
      ),
    );
  }
}

class _TestGestureRecognizer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GestureRecognizerState();
}

class _GestureRecognizerState extends State<_TestGestureRecognizer> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关
  @override
  void dispose() {
    //⽤到GestureRecognizer的话⼀定要调⽤其dispose⽅法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "hello "),
        TextSpan(
          text: "点我变色",
          style: TextStyle(
              fontSize: 30.0, color: _toggle ? Colors.blue : Colors.red),
          recognizer: _tapGestureRecognizer
            ..onTap = () {
              setState(() {
                _toggle = !_toggle;
              });
            }
        ),
        TextSpan(text: " world")
      ])),
    );
  }
}
