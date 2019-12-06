import 'package:flutter/material.dart';

//使用默认构造函数写 PageView，只适用于那些只有少量 子Widget 的 PageView。
//void main() => runApp(PageViewDefaultWidget());
//使用 PageView.builder,可用于和数据绑定实现大量或无限的列表
void main() => runApp(PageViewBuilderWidget());

class PageViewDefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("PageViewDefaultWidget"),
        ),
        body: PageView(
          onPageChanged: (index) {
            print("current page $index");
          },
          children: <Widget>[
            ListTile(title: Text('Title0')),
            ListTile(title: Text('Title1')),
            ListTile(title: Text('Title2')),
            ListTile(title: Text('Title3')),
            ListTile(title: Text('Title4')),
          ],
        ),
      ),
    );
  }
}

class PageViewBuilderWidget extends StatelessWidget {
  final List<String> items;

  PageViewBuilderWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PageViewBuilderWidget",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("PageViewBuilderWidget"),
        ),
        body: PageView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
          itemCount: items.length,
          onPageChanged: (index) {
            print("current page $index");
          },
        ),
      ),
    );
  }
}

class PageViewCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("PageViewCustomWidget"),
        ),
        body: PageView.custom(
          childrenDelegate: SliverChildListDelegate(<Widget>[
            ListTile(title: Text('Title0')),
            ListTile(title: Text('Title1')),
            ListTile(title: Text('Title2')),
            ListTile(title: Text('Title3')),
            ListTile(title: Text('Title4')),
          ]),
          onPageChanged: (index) {
            print("current page $index");
          },
        ),
      ),
    );
  }
}
