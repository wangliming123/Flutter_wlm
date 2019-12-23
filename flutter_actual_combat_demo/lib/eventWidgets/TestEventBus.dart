import 'package:flutter/material.dart';
import 'package:flutter_actual_combat_demo/eventWidgets/EventBus.dart';

class TestEventBus extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TestEventBusState();

}

class _TestEventBusState extends State<TestEventBus> {
  var _loginText = "I am login";
  @override
  void initState() {
    super.initState();
    bus.on("login", (arg) {
      _loginText ="I am login callback: $arg";
      print(_loginText);
      //思考：为什么不能setState？
//      setState(() {
//      });
    });
  }
  @override
  void dispose() {
    super.dispose();
    bus.off("login");
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("事件总线")),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) {
                  return new _TestEventBusPage2();
                }));
              },
              child: Text("login"),
            ),
            Text(_loginText, style: TextStyle(color: Colors.red))
          ],
        )
      ),
    );
  }
}

class _TestEventBusPage2 extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    print("login success");
    var userInfo = "Hello World";
    bus.emit("login", userInfo);
    return Scaffold(
      appBar: AppBar(title: Text("事件总线-page2")),
      body: Center(
        child: Text("login success")
      ),
    );
  }
}