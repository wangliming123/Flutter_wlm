import 'package:flutter/material.dart';
import 'package:flutter_actual_combat_demo/baseWidgets/ButtonWidget.dart';
import 'package:flutter_actual_combat_demo/baseWidgets/FormWidget.dart';
import 'package:flutter_actual_combat_demo/baseWidgets/ImageWidget.dart';
import 'package:flutter_actual_combat_demo/baseWidgets/SwitchAndCheckboxWidget.dart';
import 'package:flutter_actual_combat_demo/baseWidgets/TextFieldWidget.dart';
import 'package:flutter_actual_combat_demo/baseWidgets/TextWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<String> items = [
    "new_page", "text and style", "buttons", "images", "switch and checkbox",
    "TextField", "Form"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "new_page": (context) => NewRoute(),
        "text and style": (context) => TextWidget(),
        "buttons": (context) => ButtonWidget(),
        "images": (context) => ImageWidget(),
        "switch and checkbox": (context) => SwitchAndCheckboxWidget(),
        "TextField": (context) => TextFieldWidget(),
        "Form": (context) => FormWidget(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', items: items),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.items}) : super(key: key);

  final List<String> items;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return RaisedButton(
            padding: EdgeInsets.all(8.0),
            onPressed: () {
              //导航到新路由
              Navigator.pushNamed(context, widget.items[index]);
//                    Navigator.push(context,
//                        new MaterialPageRoute(builder: (context) {
//                          return new NewRoute();
//                        }));
            },
            child: Text(widget.items[index],
                style: TextStyle(color: Colors.blue, fontSize: 18)),
          );
        },
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Route")),
      body: Center(
        child: Text("This is New Route"),
      ),
    );
  }
}
