
import 'package:flutter/material.dart';

void main() => runApp(PaddingApp());

class PaddingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Padding Widget",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Padding Widget"),),
        body: Padding(
          padding: EdgeInsets.all(100),
          child: Text("Hello Padding"),
        ),
      ),
    );
  }

}