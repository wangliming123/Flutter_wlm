import 'package:flutter/material.dart';
import 'package:flutter_example/util/styleUtils.dart';

//void main() => runApp(ThemeDataWidget());
void main() => runApp(MediaQueryWidget());

class ThemeDataWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    //要想在 Flutter 中获取 Theme 的实例，首先 根Widget 必须是 MaterialApp
    return MaterialApp(
      title: "test theme",
      theme: ThemeData(
        primaryColor: Colors.orange
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("ThemeDataWidget"),),

          //这种写法不行，why????
//        body: Text("Theme.of(context)", style: TextUtil.getThemeStyle(context),),
        body: ThemeText(),
      ),
    );
  }
}
class ThemeText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("Theme.of(context)", style: TextUtil.getThemeStyle(context));
  }
}


GlobalKey _key = new GlobalKey();

class MediaQueryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test MediaQueryWidget",
      home: Scaffold(
        appBar: AppBar(title: Text("MediaQueryWidget"),),
        body: MediaQueryBody(),
      ),
    );
  }
}

class MediaQueryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Text("Child", key: _key,),
        RaisedButton(
          child: Text("Screen size"),
          onPressed: () {
            Size size = MediaQuery.of(context).size;
            print("Screen Width: ${size.width}  Height: ${size.height}");
          },
        ),
        RaisedButton(
          child: Text("Child size"),
          onPressed: () {
            Size size = _key.currentContext.size;
            print("Child Width: ${size.width}  Height: ${size.height}");
          },
        ),
        RaisedButton(
          child: Text("devicePixelRatio"),
          onPressed: () {
            print("devicePixelRatio: ${MediaQuery.of(context).devicePixelRatio}");
          },
        ),
      ],
    );
  }
}