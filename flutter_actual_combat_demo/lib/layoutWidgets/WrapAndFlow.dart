import 'package:flutter/material.dart';
import 'package:flutter_actual_combat_demo/util/styleUtils.dart';

class WrapAndFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("流式布局")),
      body: Column(
        children: <Widget>[
          //Row和Column，子widget超出屏幕范围，则会溢出报错
          Row(children: <Widget>[Text("xxx" * 40)]),
          //Row换成Wrap后溢出部分则会⾃动折⾏
          Wrap(children: <Widget>[
            Text("xxx" * 40, style: TextStyle(color: Colors.blue))
          ]),
          Wrap(
            spacing: 8.0, // 主轴(⽔平)⽅向间距
            runSpacing: 4.0, // 纵轴（垂直）⽅向间距
            alignment: WrapAlignment.center, //沿主轴⽅向居中
            children: <Widget>[
              Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue, child: Text("A")),
                  label: Text("Hamilton")),
              Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue, child: Text("M")),
                  label: Text("Lafayette")),
              Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue, child: Text("H")),
                  label: Text("Mulligan")),
              Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue, child: Text("J")),
                  label: Text("Laurens"))
            ],
          ),
          //⼀般很少会使⽤Flow，因为其过于复杂，需要⾃⼰实现⼦widget的位置转换
          //Flow主要⽤于⼀些需要⾃定义布局策略或性能要求较⾼(如动画中)的场景
          Flow(
            delegate: TestFlowDelegate(EdgeInsets.all(10.0)),
            children: <Widget>[
              new Container(width: 80.0, height: 80.0, color: Colors.red),
              new Container(width: 80.0, height: 80.0, color: Colors.green),
              new Container(width: 80.0, height: 80.0, color: Colors.blue),
              new Container(width: 80.0, height: 80.0, color: Colors.yellow),
              new Container(width: 80.0, height: 80.0, color: Colors.brown),
              new Container(width: 80.0, height: 80.0, color: Colors.purple),
            ],
          )
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate(this.margin);

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每⼀个⼦widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制⼦widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
