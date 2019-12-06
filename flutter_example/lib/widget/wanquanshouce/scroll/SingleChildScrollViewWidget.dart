import 'package:flutter/material.dart';
import 'package:flutter_example/util/styleUtils.dart';

void main() => runApp(SingleChildApp());

class SingleChildApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "test SingleChildScrollView",
      home: new Scaffold(
        appBar: AppBar(title: new Text("test SingleChildScrollView"),),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[Text("Hello wlm " * 100, style: TextStyles.normalText)],
          ),
        ),
      ),
    );
  }
}