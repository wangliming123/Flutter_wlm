import 'package:flutter/material.dart';

class TestInheritedWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InheritedState();
  }
}

class _InheritedState extends State<TestInheritedWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("父子数据共享")),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("父Widget：$count"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: _TestWidget(),
              ),
              RaisedButton(
                child: Text("Increment"),
                onPressed: () {
                  //每点击⼀次，将count⾃增，然后重新build,ShareDataWidget的data将被更新
                  setState(() {
                    ++count;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text("子Widget：${ShareDataWidget.of(context).data}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //⽗或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调⽤。
    //如果build中没有依赖InheritedWidget，则此回调不会被调⽤。
    print("Dependencies change: ${ShareDataWidget.of(context).data}");
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);
  final int data; //需要在⼦树中共享的数据，保存点击次数

  //定义⼀个便捷⽅法，⽅便⼦树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: ShareDataWidget);
  }

  //该回调决定当data发⽣变化时，是否通知⼦树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回false，则⼦树中依赖(build函数中有调⽤)本widget
    //的⼦widget的`state.didChangeDependencies`会被调⽤
    print("old: ${oldWidget.data}, this:${this.data}");
    return oldWidget.data != this.data;
  }
}
