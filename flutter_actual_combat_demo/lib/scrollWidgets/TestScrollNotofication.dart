import 'package:flutter/material.dart';

class TestScrollNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("监听ListView滚动通知")),
      body: _ScrollNotificationWidget(),
    );
  }
}

class _ScrollNotificationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollNotificationState();
  }
}

class _ScrollNotificationState extends State<_ScrollNotificationWidget> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          double progerss = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          setState(() {
            _progress = "${(progerss * 100).toInt()}%";
          });
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          return false;//return true 进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) {
                return ListTile(title: Text("$index"));
              },
            ),
            //显示百分比
            CircleAvatar(
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      ),
    );
  }
}
