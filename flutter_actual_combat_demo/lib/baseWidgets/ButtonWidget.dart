import 'package:flutter/material.dart';
import 'package:flutter_actual_combat_demo/util/styleUtils.dart';

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("按钮")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //RaisedButton 即"漂浮"按钮，它默认带有阴影和灰⾊背景
              RaisedButton(
                child: Text("Raised"),
                onPressed: () => {},
              ),
              RaisedButton(
                child: Text("Button"),
                color: Colors.blue,
                onPressed: () => {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //FlatButton即扁平按钮，默认背景透明并不带阴影
              FlatButton(
                child: Text("Flat"),
                onPressed: () => {},
              ),
              FlatButton(
                child: Text("Button"),
                color: Colors.blue,
                onPressed: () => {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //OutlineButton默认有⼀个边框，不带阴影且背景透明
              OutlineButton(
                child: Text("Outline"),
                onPressed: () => {},
              ),
              OutlineButton(
                child: Text("Button"),
                color: Colors.blue,
                onPressed: () => {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //IconButton是⼀个可点击的Icon，不包括⽂字，默认没有背景，点击后会出现背景
              IconButton(icon: Icon(Icons.thumb_up), onPressed: () => {}),
              IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () => {},
                  color: Colors.blue)
            ],
          ),
          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Hello Himma", style: TextStyles.whiteStyle,),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () =>{},
          ),
          //RaisedButton默认有配置阴影（elevation）
          RaisedButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Hello Himma", style: TextStyles.whiteStyle,),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            onPressed: () =>{},
          ),
        ],
      ),
    );
  }
}
