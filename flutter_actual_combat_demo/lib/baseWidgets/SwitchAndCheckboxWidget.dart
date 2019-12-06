import 'package:flutter/material.dart';

class SwitchAndCheckboxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SwitchAndCheckboxState();
  }
}

class _SwitchAndCheckboxState extends State<SwitchAndCheckboxWidget> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;
  String userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("单选开关和复选框")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Switch(
              value: _switchSelected,
              onChanged: (bool value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red,
              tristate: true, //是否有三态（默认为两态true，false），第三态为null
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
