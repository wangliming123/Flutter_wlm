import 'package:flutter/material.dart';

class BasicWidget extends StatelessWidget {
  final String title;
  final Widget body;

  BasicWidget({@required this.title, @required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: body,
    );
  }
}
