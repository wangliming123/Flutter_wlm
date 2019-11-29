import 'package:flutter/material.dart';

void main() => runApp(CenterApp());

class CenterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Center Widget",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Center Widget"),
        ),
        body: Center(
          child: Text(
            'Hello Center',
            style: TextStyle(color: Colors.red, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
