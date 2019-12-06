import 'package:flutter/material.dart';

void main() => runApp(PopupMenuApp());

class PopupMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PopupMenu Widget",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("PoputMenu Widget"),
        ),
        body: PopupMenuButton(
          child: Text("更多"),
          onSelected: (MenuItem result) {
            print("click" + result.toString());
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
            const PopupMenuItem<MenuItem>(
              child: Text("menu A"),
              value: MenuItem.menuA,
            ),
            const PopupMenuItem<MenuItem>(
              child: Text("menu B"),
              value: MenuItem.menuB,
            ),
            const PopupMenuItem<MenuItem>(
              child: Text("menu C"),
              value: MenuItem.menuC,
            ),
            const PopupMenuItem<MenuItem>(
              child: Text("menu D"),
              value: MenuItem.menuD,
            ),
          ],
        ),
      ),
    );
  }
}

enum MenuItem { menuA, menuB, menuC, menuD }
