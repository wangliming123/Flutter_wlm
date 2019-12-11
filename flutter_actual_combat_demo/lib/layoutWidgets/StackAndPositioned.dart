import 'package:flutter/material.dart';

class StackAndPositioned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("层叠布局")),
      //通过ConstrainedBox来确保Stack占满屏幕
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对⻬⽅式
          //第二个子widget未定位，fit起作用，会覆盖第一个子widget
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Positioned(child: Text("I am Jack"), left: 18.0),
            Container(
              child: Text("Hello World", style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(child: Text("Your friend"), top: 18.0)
          ],
        ),
      ),
    );
  }
}
