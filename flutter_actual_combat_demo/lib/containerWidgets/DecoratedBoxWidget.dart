import 'package:flutter/material.dart';

class DecoratedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("装饰类容器")),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[800], Colors.blue[500]]),
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0)
                ]),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 80.0),
                child: Text("登录", style: TextStyle(color: Colors.white))),
          ),
        ));
  }
}
