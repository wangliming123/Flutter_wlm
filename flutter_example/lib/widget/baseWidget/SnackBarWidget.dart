import 'package:flutter/material.dart';

void main() => runApp(SnackBarApp());

class SnackBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SnackBar Widget",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("SnackBar Widget"),
        ),

        //会报错，
//        body: RaisedButton(
//          child: Text('Show SnackBar'),
//          onPressed: () {
//            Scaffold.of(context).showSnackBar(SnackBar(
//                content: Text('SnackBar'), duration: Duration(seconds: 5)));
//          },
//        ),
        body: Builder(
          builder: (context) =>
              RaisedButton(
                child: Text('show SnackBar'),
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('SnackBar'),
                    duration: Duration(seconds: 5),
                  ));
                },
              ),
        ),
      ),
    );
  }
}
