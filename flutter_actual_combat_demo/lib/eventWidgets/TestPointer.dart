import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPointer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PointerState();
}

class _PointerState extends State<TestPointer> {
  PointerEvent _event; //定义一个状态，保存当前指针位置

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Pointer事件")),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Listener(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.yellow[200],
                  width: double.infinity,
                  height: 120.0,
                  child: Text(_event?.toString() ?? "",
                      style: TextStyle(color: Colors.blue)),
                ),
                onPointerDown: (PointerDownEvent event) =>
                    setState(() => _event = event),
                onPointerMove: (PointerMoveEvent event) =>
                    setState(() => _event = event),
                onPointerUp: (PointerUpEvent event) =>
                    setState(() => _event = event),
              ),
              Listener(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints.tight(Size(double.infinity, 200.0)),
                  child: Center(child: Text("Box A")),
                ),
                onPointerDown: (event) => print("down A"),
//                behavior: HitTestBehavior.opaque,//放开注释，点击空白区域可以出发点击事件
              ),
              Stack(
                children: <Widget>[
                  Listener(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints.tight(Size(double.infinity, 200.0)),
                      child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.blue)),
                    ),
                    onPointerDown: (event) => print("down0"),
                  ),
                  Listener(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                      child: Center(child: Text("左上⻆200*100范围内⾮⽂本区域点击")),
                    ),
                    onPointerDown: (event) => print("down1"),
//                    behavior: HitTestBehavior.translucent, //放开此⾏注释后可以"点透"
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
