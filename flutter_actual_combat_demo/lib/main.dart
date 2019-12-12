import 'package:flutter/material.dart';
import 'package:flutter_actual_combat_demo/containerWidgets/TestContainer.dart';
import 'package:flutter_actual_combat_demo/scrollWidget/TestCustomScrollView.dart';
import 'package:flutter_actual_combat_demo/scrollWidget/TestGridView.dart';
import 'package:flutter_actual_combat_demo/scrollWidget/TestGridViewBuilder.dart';
import 'package:flutter_actual_combat_demo/scrollWidget/TestInfiniteListView.dart';
import 'package:flutter_actual_combat_demo/scrollWidget/TestListView.dart';
import 'package:flutter_actual_combat_demo/scrollWidget/TestScrollController.dart';
import 'package:flutter_actual_combat_demo/scrollWidget/TestScrollNotofication.dart';
import 'package:flutter_actual_combat_demo/scrollWidget/TestSingleChildScroll.dart';
import 'baseWidgets/ButtonWidget.dart';
import 'baseWidgets/FormWidget.dart';
import 'baseWidgets/ImageWidget.dart';
import 'baseWidgets/SwitchAndCheckboxWidget.dart';
import 'baseWidgets/TextFieldWidget.dart';
import 'baseWidgets/TextWidget.dart';
import 'containerWidgets/ConstrainedBoxWidget.dart';
import 'containerWidgets/DecoratedBoxWidget.dart';
import 'containerWidgets/PaddingWidget.dart';
import 'layoutWidgets/FlexWidget.dart';
import 'layoutWidgets/RowAndColumn.dart';
import 'layoutWidgets/StackAndPositioned.dart';
import 'containerWidgets/TestTransform.dart';
import 'layoutWidgets/WrapAndFlow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = {
    "Source Code": (context) => NewRoute(),
    "text and style": (context) => TextWidget(),
    "buttons": (context) => ButtonWidget(),
    "images": (context) => ImageWidget(),
    "switch and checkbox": (context) => SwitchAndCheckboxWidget(),
    "TextField": (context) => TextFieldWidget(),
    "Form": (context) => FormWidget(),
    "Row and Column": (context) => RowAndColumn(),
    "Flex": (context) => FlexWidget(),
    "Wrap and Flow": (context) => WrapAndFlow(),
    "Stack and Positioned": (context) => StackAndPositioned(),
    "Padding": (context) => PaddingWidget(),
    "ConstrainedBox": (context) => ConstrainedBoxWidget(),
    "DecoratedBox": (context) => DecoratedBoxWidget(),
    "Transform": (context) => TestTransform(),
    "Container": (context) => TestContainer(),
    "SingleChildScrollView": (context) => TestSingleChildScroll(),
    "ListView": (context) => TestListView(),
    "InfiniteListView": (context) => TestInfiniteListView(),
    "GridView": (context) => TestGridView(),
    "GridViewBuilder": (context) => TestGridViewBuilder(),
    "CustomScrollView": (context) => TestCustomScrollView(),
    "ScrollController": (context) => TestScrollController(),
    "ScrollNotification": (context) => TestScrollNotification(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title: 'Flutter Demo Home Page', items: routes.keys.toList()),
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
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        padding: EdgeInsets.all(5.0),
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
    String sourceUrl =
        "https://github.com/wangliming123/Flutter_wlm/tree/master/flutter_actual_combat_demo";
    return Scaffold(
      appBar: AppBar(title: Text("Source Code Route")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text.rich(TextSpan(children: [
            TextSpan(text: "source code: "),
            TextSpan(text: sourceUrl, style: TextStyle(color: Colors.blue))
          ])),
        ),
      ),
    );
  }
}
