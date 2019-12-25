import 'package:flutter/material.dart';

class TestStagger extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StaggerState();
}

class _StaggerState extends State<TestStagger>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("交错动画")),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5))
            ),
            child: StaggerAnimation(controller: _controller),
          ),
        ),
      ),
    );
  }

  Future<Null> _playAnimation() async {
    try{
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      print("the animation got canceled, probably because we were disposed");
    }
  }
}

class StaggerAnimation extends StatefulWidget {

  final Animation<double> controller;

  StaggerAnimation({Key key, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StaggerAnimationState();

}

class _StaggerAnimationState extends State<StaggerAnimation> {

  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;


  @override
  void initState() {
    super.initState();
    //高度动画
    height = Tween<double>(begin: 0.0, end: 300.0).animate(CurvedAnimation(
      parent: widget.controller,
      curve: Interval(0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease),
    ));

    color = ColorTween(begin: Colors.green, end: Colors.red)
        .animate(CurvedAnimation(
      parent: widget.controller,
      curve: Interval(0.0, 0.6, //间隔，前60%的动画时间
          curve: Curves.ease),
    ));

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: 0.0),
      end: EdgeInsets.only(left: 100),
    ).animate(CurvedAnimation(
      parent: widget.controller,
      curve: Interval(0.6, 1.0, //间隔，后40%的动画时间
          curve: Curves.ease),
    ));
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(color: color.value, width: 50.0, height: height.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: widget.controller, builder: _buildAnimation);
  }
}
