
import 'package:flutter/material.dart';
import 'package:flutter_example/util/styleUtils.dart';

void main() => runApp(ContainerApp());

class ContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Container Widget",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Container Widget"),),
        body: Container(
          margin: EdgeInsets.only(top: 50.0, left: 120.0),
          constraints: BoxConstraints.tightFor(width: 200, height: 150),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.green, Colors.blue],
              center: Alignment.topLeft,
              radius: .98,
            ),
            boxShadow:[
              BoxShadow(
                color: Colors.black54,
                offset: Offset(2, 2),
                blurRadius: 4.0,
              )
            ],
          ),
          transform: Matrix4.rotationZ(.2),
          alignment: Alignment.center,
          child: Text(
            "Hello Container",
            style: TextUtil.whiteStyle,
          ),
        ),
      ),
    );
  }

}