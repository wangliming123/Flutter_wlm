import 'package:flutter/material.dart';
import 'package:flutter_actual_combat_demo/BasicWidget.dart';

class TestHeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero动画")),
      body: Container(
        alignment: Alignment.center,
        child: InkWell(
          child: Hero(
            tag: "avatar", //唯⼀标记，前后两个路由⻚Hero的tag必须相同
            child: ClipOval(
              child: Image.asset("assets/images/flutter.png", width: 100.0),
            ),
          ),
          onTap: () {
            //打开B路由
            Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                  opacity: animation,
                  child: BasicWidget(
                    title: "原图",
                    body: Center(
                      child: Hero(
                          tag: "avatar", //唯⼀标记，前后两个路由⻚Hero的tag必须相同
                          child: Image.asset("assets/images/flutter.png")),
                    ),
                  ));
            }));
          },
        ),
      ),
    );
  }
}
