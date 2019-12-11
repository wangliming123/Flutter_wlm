import 'package:flutter/material.dart';

class TextStyles {
  static final TextStyle normalText = TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w900,
      backgroundColor: Color.fromARGB(200, 200, 200, 255)
  );

  static final TextStyle blueText = TextStyle(
    color: Colors.blue,
    fontSize: 20.0,
  );

  static final TextStyle redText = TextStyle(
    color: Colors.red,
    fontSize: 20.0,
  );

  static final TextStyle whiteStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
  );

  static TextStyle getThemeStyle(BuildContext context) {
    return TextStyle(
        color: Theme.of(context).primaryColor,
    );
  }

  static final helloWorldText = TextStyle(
      height: 1.2,
      fontSize: 18,
      color: Colors.blue,
      fontFamily: "Courier",
      background: new Paint()..color=Colors.yellow,
      decoration: TextDecoration.underline,
      decorationStyle: TextDecorationStyle.dashed
  );

  static final gigiText = TextStyle(
    fontFamily: "GIGI",
  );

  static final harlowsiText = TextStyle(
    fontFamily: "HARLOWSI",
  );

}