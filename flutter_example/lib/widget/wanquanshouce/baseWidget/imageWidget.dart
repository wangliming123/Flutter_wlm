import 'package:flutter/material.dart';

void main() => runApp(ImageApp());

class ImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Image Widget",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Image Widget"),
          ),
          body: Column(
            children: <Widget>[
              Image.asset(
                "images/flutter.png",
                fit: BoxFit.cover,
              ),
              Image.network(
                  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557781801455&di=17f9f2fc3ded4efb7214d2d8314e8426&imgtype=0&src=http%3A%2F%2Fimg2.mukewang.com%2F5b4c075b000198c216000586.jpg"),
              Icon(
                Icons.android,
                size: 50.0,
                color: Colors.green,
              )
            ],
          )),
    );
  }
}
