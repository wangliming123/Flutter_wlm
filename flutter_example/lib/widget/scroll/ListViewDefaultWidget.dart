
import 'package:flutter/material.dart';

void main() => runApp(ListViewDefaultApp());

class ListViewDefaultApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Test ListView")),
        body: ListView(
          children: <Widget>[
            ListTile(title: Text("title1"),),
            ListTile(title: Text("title2"),),
            ListTile(title: Text("title3"),),
            ListTile(title: Text("title4"),),
            ListTile(title: Text("title5"),),
            ListTile(title: Text("title6"),),
            ListTile(title: Text("title7"),),
            ListTile(title: Text("title8"),),
            ListTile(title: Text("title9"),),
            ListTile(title: Text("title10"),),
            ListTile(title: Text("title11"),),
            ListTile(title: Text("title12"),),
            ListTile(title: Text("title13"),),
            ListTile(title: Text("title14"),),
            ListTile(title: Text("title15"),),
            ListTile(title: Text("title16"),),
            ListTile(title: Text("title17"),),
            ListTile(title: Text("title18"),),
            ListTile(title: Text("title19"),),
            ListTile(title: Text("title20"),),
          ],
        ),
      ),
    );
  }
}
