import 'package:flutter/material.dart';

void main() => runApp(AlignApp());

class AlignApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Align Widget",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Align Widget"),
        ),
        body: Align(
          alignment: Alignment.topRight,
          child: Text(
            "Hello Align",
            style: TextStyle(color: Colors.red, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
