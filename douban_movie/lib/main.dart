import 'package:douban_movie/navi/HotWidget.dart';
import 'package:douban_movie/navi/MineWidget.dart';
import 'package:douban_movie/navi/SearchWidget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String titleName = '豆瓣电影';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
//        primaryColor: Colors.white
      ),
      home: MyHomePage(title: titleName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectIndex = 0;
//  final _navigationItems = [StatefulText("热映"), StatefulText("找片"), StatefulText("我的")];
  final _navigationText = [Text("热映"), Text("找片"), Text("我的")];
  final _navigationItems = [HotWidget(), SearchWidget(), MineWidget()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _navigationItems[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: _navigationText[0]),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: _navigationText[1]),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), title: _navigationText[2]),
        ],
        currentIndex: _selectIndex,
        fixedColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _selectIndex = index;
          });
        },
      ),
    );
  }
}
