import 'package:flutter/material.dart';

class TestNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NotificationState();
  }
}

class _NotificationState extends State<TestNotification> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("通知Notification")),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                    onPressed: () => MyNotification("Hi").dispatch(context),
                    child: Text("Send Notification"),
                  );
                },
              ),
              Text(_msg)
            ],
          ),
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  final String msg;

  MyNotification(this.msg);
}
