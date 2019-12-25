import 'package:flutter/material.dart';

class TestScaleAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<TestScaleAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变为300
//    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)//匀速放大
    //弹簧效果
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
    //启动动画（正向执行）
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("动画基本结构")),
      body: Center(
//        child: Image.asset("assets/images/flutter.png", width: animation.value),
        child: AnimatedImage(
            animation: animation, assetPath: "assets/images/flutter.png"),
      ),
    );
  }

  @override
  void dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage(
      {Key key, Animation<double> animation, @required this.assetPath})
      : super(key: key, listenable: animation);

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(assetPath, width: animation.value),
    );
  }
}
