import 'package:flutter/material.dart';

class PaddingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("padding")),
      body: Padding(
        //上下左右各添加16单位补⽩
          padding: EdgeInsets.all(16.0),
          child: Column(
            //左对⻬，排除对⻬⼲扰
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //左边添加8单位补⽩
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("hello world")),
              //上下添加8单位补⽩
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("I am Jack")),
              //指定四个方向补白
              Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                  child: Text("Your friend"))
            ],
          ),
      )
    );
  }
}
