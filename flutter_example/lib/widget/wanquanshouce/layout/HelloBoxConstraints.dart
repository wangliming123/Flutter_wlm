import 'package:flutter/material.dart';

void main() => runApp(BoxConstraintsApp("Hello BoxConstraints"));

class BoxConstraintsApp extends StatefulWidget {
  String content;

  BoxConstraintsApp(this.content);

  @override
  State<StatefulWidget> createState() {
    return BoxConstraintsState();
  }
}

class BoxConstraintsState extends State<BoxConstraintsApp> {
  @override
  Widget build(BuildContext context) {
    Paint paint = new Paint();
    paint.color = Colors.yellow;
    return MaterialApp(
      title: "Hello BoxConstraints",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello BoxConstraints"),
        ),
        body: Container(
          constraints: BoxConstraints.tight(Size(100, 100)),
          color: Colors.red,
          child: Text(
            "Hello BoxConstraints",
            style: TextStyle(background: paint),
          ),
        ),
      ),
    );
  }
}
