import 'package:flutter/material.dart';

class TestAnimationBuilder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationBuilderState();
}

class _AnimationBuilderState extends State<TestAnimationBuilder>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变为300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller); //匀速放大
      //弹簧效果
//    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
//    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)

    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        //动画执⾏结束时反向执⾏动画
        controller.reverse();
      }else if(status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执⾏动画（正向）
        controller.forward();
      }
    });
    //启动动画（正向执行）
    controller.forward();
  }

  @override
  void dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("动画基本结构")),
      body: Column(
        children: <Widget>[
          AnimatedBuilder(
            animation: animation,
            child: Image.asset("assets/images/flutter.png"),
            builder: (BuildContext context, Widget child) {
              return Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  width: animation.value,
                  child: child,
                ),
              );
            },
          ),
          GrowTransition(
            child: Image.asset("assets/images/flutter.png"),
            animation: animation,
          )
        ],
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  GrowTransition({this.child, this.animation});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: child,
        builder: (context, child) {
          return Container(width: animation.value, child: child);
        },
      ),
    );
  }
}
