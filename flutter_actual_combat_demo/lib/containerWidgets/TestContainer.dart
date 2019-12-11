import 'package:flutter/material.dart';

class TestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Container容器")),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20.0, left: 60.0,bottom: 40.0),
            constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98),
                boxShadow: [//卡⽚阴影
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            transform: Matrix4.rotationZ(.2),//卡⽚倾斜变换
            alignment: Alignment.center,//卡⽚内⽂字居中
            child: Text("5.20",
                style: TextStyle(color: Colors.white, fontSize: 40.0)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            //padding与margin的区别
            Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.orange,
                child: Text("Hello World")),
            Container(
                margin: EdgeInsets.all(20.0),
                color: Colors.orange,
                child: Text("Hello World")),
          ])
        ],
      ),
    );
  }
}
