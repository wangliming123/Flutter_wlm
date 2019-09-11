
import 'package:flutter/material.dart';

void main() => runApp(MyApp("Hello World"));

class MyApp extends StatelessWidget {
  final String content;

  MyApp(this.content);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "stateless demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body:Center(
          child: Text(content),
        ),
      ),
    );
  }

}