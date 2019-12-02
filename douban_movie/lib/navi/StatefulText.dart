import 'package:flutter/material.dart';

class StatefulText extends StatefulWidget {
  final String text;

  StatefulText(this.text);

  @override
  State<StatefulWidget> createState() {
    return StatefulTextState(text);
  }
}

class StatefulTextState extends State<StatefulText> {
  String text;

  StatefulTextState(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
