import 'package:flutter/material.dart';

class RowAndColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("线性布局")),
        body: Container(
          color: Colors.green[200],
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              //测试Row对⻬⽅式，排除Column默认居中对⻬的⼲扰
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max, //有效，外层Colum⾼度为整个屏幕
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  textDirection: TextDirection.rtl,
                  children: <Widget>[
                    Text(" hello world "),
                    Text(" I am Jack "),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  verticalDirection: VerticalDirection.up,
                  children: <Widget>[
                    Text(" hello world ", style: TextStyle(fontSize: 30.0)),
                    Text(" I am Jack "),
                  ],
                ),
                Container(
                  color: Colors.red,
                  child: Column(
                    mainAxisSize: MainAxisSize.max, //⽆效，内层Colum⾼度为实际⾼度
                    children: <Widget>[
                      Text("hello world "),
                      Text("I am Jack "),
                    ],
                  ),
                ),
                //如果要让⾥⾯的Column占满外部Column，可以使⽤Expanded
                Expanded(
                  child:  Container(
                    color: Colors.yellow,
                    child: Column(
                      mainAxisSize: MainAxisSize.max, //⽆效，内层Colum⾼度为实际⾼度
                      children: <Widget>[
                        Text("hello world "),
                        Text("I am Jack "),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
