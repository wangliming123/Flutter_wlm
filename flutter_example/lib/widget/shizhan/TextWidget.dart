import 'package:flutter/material.dart';
import 'package:flutter_example/util/styleUtils.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("字体及样式"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Hello World, " * 6, textAlign: TextAlign.center),
          Text("Hello World, " * 6,
              maxLines: 1, overflow: TextOverflow.ellipsis),
          Text("Hello World", textScaleFactor: 1.5),
          Text("Hello World", style: TextStyles.helloWorldText),
          Text.rich(TextSpan(children: [
            TextSpan(text: "home: "),
            TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(color: Colors.blue),
//                recognizer: _tapRecognizer
            )
          ])),
          DefaultTextStyle(
            style: TextStyles.redText,
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("I am Jack"),
                Text("I am Milker", style: TextStyle(inherit: false, color: Colors.grey),)
              ],
            ),
          ),
          Text("I am GIGI text font", style: TextStyles.gigiText),
          Text("I am HARLOWSI text font", style: TextStyles.harlowsiText),
        ],
      ),
    );
  }
}
