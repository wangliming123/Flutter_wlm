import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Expanded可以按⽐例“扩伸”Row、Column和Flex⼦widget所占⽤的空间。
class FlexWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("弹性布局")),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              //Flex的两个⼦widget按1：2来占据⽔平空间
              Expanded(
                flex: 1,
                child: Container(height: 40.0, color: Colors.red),
              ),
              Expanded(
                flex: 2,
                child: Container(height: 40.0, color: Colors.green),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 140.0,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  //Flex的三个⼦widget，在垂直⽅向按2：1：1来占⽤100像素的空间
                  Expanded(
                      flex: 2,
                      child: Container(height: 30.0, color: Colors.red)),
                  Spacer(flex: 1),
                  Expanded(
                      flex: 1,
                      child: Container(height: 30.0, color: Colors.green))

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
