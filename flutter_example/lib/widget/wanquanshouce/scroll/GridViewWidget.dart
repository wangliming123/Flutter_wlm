import 'package:flutter/material.dart';

//void main() => runApp(GridViewDefaultWidget());
//void main() => runApp(GridViewCountWidget());
//void main() => runApp(GridViewExtentWidget());
//void main() => runApp(GridViewBuilderWidget(
//      items: List<String>.generate(10000, (i) => "Item $i"),
//    ));
void main() => runApp(GridViewCustomWidget());



class GridViewDefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridViewDefaultWidget"),
        ),
        body: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: <Widget>[
            ListTile(title: Text('Title1')),
            ListTile(title: Text('Title2')),
            ListTile(title: Text('Title3')),
            ListTile(title: Text('Title4')),
            ListTile(title: Text('Title5')),
            ListTile(title: Text('Title6')),
            ListTile(title: Text('Title7')),
            ListTile(title: Text('Title8')),
            ListTile(title: Text('Title9')),
            ListTile(title: Text('Title10')),
            ListTile(title: Text('Title11')),
            ListTile(title: Text('Title12')),
            ListTile(title: Text('Title13')),
            ListTile(title: Text('Title14')),
            ListTile(title: Text('Title15')),
            ListTile(title: Text('Title16')),
            ListTile(title: Text('Title17')),
            ListTile(title: Text('Title18')),
            ListTile(title: Text('Title19')),
          ],
        ),
      ),
    );
  }
}

class GridViewCountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridViewCountWidget"),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: <Widget>[
            ListTile(title: Text('Title1')),
            ListTile(title: Text('Title2')),
            ListTile(title: Text('Title3')),
            ListTile(title: Text('Title4')),
            ListTile(title: Text('Title5')),
            ListTile(title: Text('Title6')),
            ListTile(title: Text('Title7')),
            ListTile(title: Text('Title8')),
            ListTile(title: Text('Title9')),
            ListTile(title: Text('Title10')),
            ListTile(title: Text('Title11')),
            ListTile(title: Text('Title12')),
            ListTile(title: Text('Title13')),
            ListTile(title: Text('Title14')),
            ListTile(title: Text('Title15')),
            ListTile(title: Text('Title16')),
            ListTile(title: Text('Title17')),
            ListTile(title: Text('Title18')),
            ListTile(title: Text('Title19')),
          ],
        ),
      ),
    );
  }
}

class GridViewExtentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridViewExtentWidget"),
        ),
        body: GridView.extent(
          maxCrossAxisExtent: 300,
          children: <Widget>[
            ListTile(title: Text('Title1')),
            ListTile(title: Text('Title2')),
            ListTile(title: Text('Title3')),
            ListTile(title: Text('Title4')),
            ListTile(title: Text('Title5')),
            ListTile(title: Text('Title6')),
            ListTile(title: Text('Title7')),
            ListTile(title: Text('Title8')),
            ListTile(title: Text('Title9')),
            ListTile(title: Text('Title10')),
            ListTile(title: Text('Title11')),
            ListTile(title: Text('Title12')),
            ListTile(title: Text('Title13')),
            ListTile(title: Text('Title14')),
            ListTile(title: Text('Title15')),
            ListTile(title: Text('Title16')),
            ListTile(title: Text('Title17')),
            ListTile(title: Text('Title18')),
            ListTile(title: Text('Title19')),
          ],
        ),
      ),
    );
  }
}

class GridViewBuilderWidget extends StatelessWidget {
  final List<String> items;

  GridViewBuilderWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData.light(),
      home: Scaffold(
          appBar: AppBar(
            title: Text("GridViewBuilderWidget"),
          ),
          body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
            itemCount: items.length,
          )),
    );
  }
}

class GridViewCustomWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("GridViewBuilderWidget"),
        ),
        body: GridView.custom(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          childrenDelegate: SliverChildListDelegate(<Widget>[
            ListTile(title: Text('Title1')),
            ListTile(title: Text('Title2')),
            ListTile(title: Text('Title3')),
            ListTile(title: Text('Title4')),
            ListTile(title: Text('Title5')),
            ListTile(title: Text('Title6')),
            ListTile(title: Text('Title7')),
            ListTile(title: Text('Title8')),
            ListTile(title: Text('Title9')),
            ListTile(title: Text('Title10')),
            ListTile(title: Text('Title11')),
            ListTile(title: Text('Title12')),
            ListTile(title: Text('Title13')),
            ListTile(title: Text('Title14')),
            ListTile(title: Text('Title15')),
            ListTile(title: Text('Title16')),
            ListTile(title: Text('Title17')),
            ListTile(title: Text('Title18')),
            ListTile(title: Text('Title19')),
          ]),
        ),
      ),
    );
  }
}
