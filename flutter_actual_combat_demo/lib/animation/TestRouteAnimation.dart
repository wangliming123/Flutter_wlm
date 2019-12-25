import 'package:flutter/material.dart';
import 'package:flutter_actual_combat_demo/BasicWidget.dart';

class TestRouteAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("自定义路由动画")),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("PageRouteBuilder"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1000),
                      pageBuilder: (BuildContext context, Animation animation,
                          Animation secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: BasicWidget(
                            title: "动画路由PageB",
                            body: Center(child: Text("PageB")),
                          ),
                        );
                      },
                    ));
              },
            ),
            RaisedButton(
              child: Text("继承PageRoute"),
              onPressed: () {
                Navigator.push(context, FadeRoute(builder: (context) {
                  return BasicWidget(
                      title: "动画路由PageB", body: Center(child: Text("PageB")));
                }));
              },
            ),
            Text("虽然上⾯的两种⽅法都可以实现⾃定义切换动画，"
                "但实际使⽤时应考虑优先使⽤PageRouteBuilder，"
                "PageRouteBuilder不满足需求时，使用继承PageRoute方法")
          ],
        ),
      ),
    );
  }
}

class FadeRoute extends PageRoute {
  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;
  @override
  final Color barrierColor;
  @override
  final String barrierLabel;
  @override
  final bool maintainState;

  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 1000),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //当前路由被激活，是打开新路由
    if(isActive) {
      return FadeTransition(opacity: animation, child: builder(context));
    } else {
      //返回，则不应用动画
      return Padding(padding: EdgeInsets.zero);
    }

  }
}
