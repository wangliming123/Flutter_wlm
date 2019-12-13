import 'package:flutter/material.dart';

class TestWillPopScope extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WillPopScopeState();
  }
}

class _WillPopScopeState extends State<TestWillPopScope> {
  DateTime _lastPressedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("导航返回拦截")),
      body: WillPopScope(
        child: Container(
            alignment: Alignment.center, child: Text("一秒内连续按两次返回键退出")),
        onWillPop: () async {
          if (_lastPressedTime == null ||
              DateTime.now().difference(_lastPressedTime) >
                  Duration(seconds: 1)) {
            //第一次点击或者两次点击间隔时间超过1秒
            _lastPressedTime = DateTime.now();
            return false;
          }
          return true;
        },
      ),
    );
  }
}
