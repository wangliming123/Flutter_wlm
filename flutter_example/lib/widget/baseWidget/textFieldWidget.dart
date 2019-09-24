import 'package:flutter/material.dart';

void main() => runApp(TextFieldApp());

class TextFieldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = new TextEditingController();
    return MaterialApp(
      title: "TextField Widget",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("TextField Widget"),
        ),
        body: TextField(
          controller: _controller,
          keyboardType: TextInputType.datetime,
        ),
      ),
    );
  }
}
