import 'package:flutter/material.dart';
import 'package:flutter_actual_combat_demo/BasicWidget.dart';

class TurnBox extends StatefulWidget {
  final double turns; //旋转的“圈”数,⼀圈为360度，如0.25圈即90度
  final int speed; //过渡动画执⾏的总时⻓
  final Widget child;

  TurnBox({Key key, this.turns = 0.0, this.speed = 200, this.child});

  @override
  State<StatefulWidget> createState() => _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //旋转⻆度发⽣变化时执⾏过渡动画
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(widget.turns,
          duration: Duration(milliseconds: widget.speed ?? 200),
          curve: Curves.easeOut);
    }
  }
}

class TestTurnBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestTurnBoxState();
}

class _TestTurnBoxState extends State<TestTurnBox> {
  double _turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return BasicWidget(
      title: "TurnBox",
      body: Center(
        child: Column(
          children: <Widget>[
            TurnBox(
                turns: _turns,
                speed: 500,
                child: Icon(Icons.refresh, size: 50)),
            TurnBox(
                turns: _turns,
                speed: 1000,
                child: Icon(Icons.refresh, size: 150.0)),
            RaisedButton(
              child: Text("顺时针旋转1/5圈"),
              onPressed: () {
                setState(() {
                  _turns += 0.2;
                });
              },
            ),
            RaisedButton(
              child: Text("逆时针选择1/5圈"),
              onPressed: () {
                setState(() {
                  _turns -= 0.2;
                });
              },
            ),
            RaisedButton(
              child: Text("顺时针旋转1圈"),
              onPressed: () {
                setState(() {
                  _turns += 1.0;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
