import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  //渐变色
  final List<Color> colors;

  final double width;
  final double height;
  final Widget child;

  //点击回调
  final GestureTapCallback onTap;

  GradientButton({
    this.colors,
    this.width,
    this.height,
    @required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];
    return DecoratedBox(
      decoration: BoxDecoration(gradient: LinearGradient(colors: _colors)),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
              constraints:
                  BoxConstraints.tightFor(height: height, width: width),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                      style: TextStyle(fontWeight: FontWeight.bold),
                      child: child),
                ),
              )),
        ),
      ),
    );
  }
}

class TestGradientButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GradientButton")),
      body: Container(
        child: Column(
          children: <Widget>[
            GradientButton(
              colors: [Colors.red, Colors.yellow, Colors.green, Colors.blue],
              height: 50.0,
              child: Text("submit"),
              onTap: onTap,
            ),
            GradientButton(
              height: 50.0,
              colors: [Colors.lightGreen, Colors.green[900]],
              child: Text("submit"),
              onTap: onTap,
            ),
            GradientButton(
              height: 50.0,
              width: 100.0,
              colors: [Colors.lightBlue[200], Colors.blueAccent],
              child: Text("submit"),
              onTap: onTap,
            )
          ],
        ),
      ),
    );
  }

  onTap() {
    print("button click");
  }
}
