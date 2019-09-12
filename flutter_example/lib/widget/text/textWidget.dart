import 'package:flutter/material.dart';
import 'package:flutter_example/util/styleUtils.dart';

void main() => runApp(TextApp());

class TextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Text Widget",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Text Widget",
            style: TextUtil.blueText,
          ),
        ),
        body: Text("Hello Text"),
      ),
    );
  }
}
