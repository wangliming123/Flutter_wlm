import 'package:flutter/material.dart';
import 'package:flutter_example/util/styleUtils.dart';

void main() => runApp(TextApp());

class TextApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Text Widget",
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Text Widget",
          ),
        ),
        body: Column(
          children: <Widget>[
            Text(
              "Hello Text",
              style: TextUtil.normalText,),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "hello", style: TextUtil.blueText),
                  TextSpan(text: "Rich Text", style: TextUtil.redText),
                ]
              ),
            )
          ],
        )



      ),
    );
  }
}
