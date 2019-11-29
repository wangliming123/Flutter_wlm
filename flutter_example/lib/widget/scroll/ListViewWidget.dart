import 'package:flutter/material.dart';

//void main() => runApp(ListViewBuilderWidget(
//      items: List<String>.generate(10000, (i) => "item $i"),
//    ));

//void main() => runApp(ListViewSeparatedWidget(
//      items: List<String>.generate(10000, (i) => "item $i"),
//    ));

void main() => runApp(ListViewCustomWidget());

class ListViewBuilderWidget extends StatelessWidget {
  final List<String> items;

  ListViewBuilderWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListViewBuilder"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),
      ),
    );
  }
}

class ListViewSeparatedWidget extends StatelessWidget {
  final List<String> items;

  ListViewSeparatedWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListViewSeparatedWidget"),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
          separatorBuilder: (BuildContext, index) {
            return Container(
              constraints: BoxConstraints.tightFor(height: 10),
              color: Colors.orange,
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}

class ListViewCustomWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(title: Text("ListViewCustomWidget"),),
        body: ListView.custom(
          childrenDelegate: SliverChildListDelegate(
            <Widget>[
              ListTile(title: Text("title1"),),
              ListTile(title: Text("title1"),),
              ListTile(title: Text("title2"),),
              ListTile(title: Text("title3"),),
              ListTile(title: Text("title4"),),
              ListTile(title: Text("title5"),),
              ListTile(title: Text("title6"),),
              ListTile(title: Text("title7"),),
              ListTile(title: Text("title8"),),
              ListTile(title: Text("title9"),),
              ListTile(title: Text("title10"),),
              ListTile(title: Text("title11"),),
              ListTile(title: Text("title12"),),
              ListTile(title: Text("title13"),),
              ListTile(title: Text("title14"),),
              ListTile(title: Text("title15"),),
              ListTile(title: Text("title16"),),
              ListTile(title: Text("title17"),),
              ListTile(title: Text("title18"),),
              ListTile(title: Text("title19"),),
            ]
          ),
        ),
      ),
    );
  }
}
