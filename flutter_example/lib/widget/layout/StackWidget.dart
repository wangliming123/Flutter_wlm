import 'package:flutter/material.dart';

void main() => runApp(StackApp());

class StackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stack Widget",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("层叠布局Stack Widget"),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: 50,
              top: 100,
              child: Image.asset(
                "images/flutter.png",
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Hello Flutter",
              style: TextStyle(fontSize: 50.0),
            )
          ],
        ),
      ),
    );
  }
}
